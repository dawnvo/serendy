import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/profile/profile.dart';

part 'auth_service.g.dart';

/// 구글 로그인을 진행해요.
@riverpod
Future<AuthResponse> signInWithGoogle(
  SignInWithGoogleRef ref,
) async {
  const appAuth = FlutterAppAuth();

  // * Just a random string
  final random = Random.secure();
  final rawNonce = base64Url.encode(List.generate(16, (_) => random.nextInt(256)));
  final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

  // * Client ID that you registered with Google Cloud.
  final clientId = Platform.isAndroid
      ? "18600735360-hbntcrqhblrsha7p5gcevmit4581tngv.apps.googleusercontent.com"
      : "18600735360-l83sb41qcsuh9dn10hgiiikl0b9n1k0t.apps.googleusercontent.com";

  // * reverse DNS form of the client ID + `:/` is set as the redirect URL
  final redirectUrl = '${clientId.split('.').reversed.join('.')}:/';

  // * Fixed value for google login
  const discoveryUrl = 'https://accounts.google.com/.well-known/openid-configuration';

  // * authorize the user by opening the consent page
  final result = await appAuth.authorize(
    AuthorizationRequest(
      clientId,
      redirectUrl,
      discoveryUrl: discoveryUrl,
      nonce: hashedNonce,
      scopes: [
        'openid',
        'email',
        'profile',
      ],
    ),
  );

  if (result == null) {
    throw 'Could not find AuthorizationResponse after authorizing';
  }

  // * Request the access and id token to google
  final tokenResult = await appAuth.token(
    TokenRequest(
      clientId,
      redirectUrl,
      authorizationCode: result.authorizationCode,
      discoveryUrl: discoveryUrl,
      codeVerifier: result.codeVerifier,
      nonce: result.nonce,
      scopes: [
        'openid',
        'email',
        'profile',
      ],
    ),
  );

  final idToken = tokenResult?.idToken;
  if (idToken == null) {
    throw 'Could not find idToken from the token response';
  }

  final supabase = ref.watch(supabaseProvider);
  return supabase.auth.signInWithIdToken(
    provider: sb.Provider.google,
    idToken: idToken,
    nonce: rawNonce,
  );
}

/// 로그아웃해요.
@riverpod
Future<void> signOut(
  SignOutRef ref,
) async {
  final supabase = ref.watch(supabaseProvider);
  await supabase.auth.signOut();
}

/// 회원탈퇴해요.
@riverpod
Future<void> deleteUser(
  DeleteUserRef ref,
) async {
  final userId = ref.watch(requireUserIdProvider);
  final supabase = ref.watch(supabaseProvider);
  await supabase.auth.admin.deleteUser(userId);
}

/// 사용자 식별자를 가져와요.
@riverpod
UserID? currentUserId(
  CurrentUserIdRef ref,
) {
  final auth = ref.watch(supabaseProvider.select((_) => _.auth));
  return auth.currentSession?.user.id;
}

/// 사용자 식별자를 엄격히 가져와요.
@riverpod
UserID requireUserId(
  RequireUserIdRef ref,
) {
  final userId = ref.watch(currentUserIdProvider);
  if (userId == null) throw const UnauthorizedException();
  return userId;
}
