import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:crypto/crypto.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/user/user.dart';

part 'auth_service.g.dart';

/// 구글 로그인을 진행해요.
@riverpod
Future<AuthResponse> signInWithGoogle(
  SignInWithGoogleRef ref,
) async {
  // * Client ID that you registered with Google Cloud.
  final clientId = Platform.isIOS
      ? "18600735360-l83sb41qcsuh9dn10hgiiikl0b9n1k0t.apps.googleusercontent.com"
      : "18600735360-2cvesdao3ihimqgt1n9ck11b7kivlkuo.apps.googleusercontent.com";

  late final String? idToken;
  late final String? accessToken;
  String? rawNonce;

  // Use AppAuth to perform Google sign in on iOS
  // and use GoogleSignIn package for Google sign in on Android
  if (Platform.isIOS) {
    const appAuth = FlutterAppAuth();

    // Just a random string
    // Just a random string
    final random = Random.secure();
    rawNonce = base64Url.encode(List.generate(16, (_) => random.nextInt(256)));
    final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

    /// Set as reversed DNS form of Google Client ID + `:/` for Google login
    final redirectUrl = '${clientId.split('.').reversed.join('.')}:/';

    /// Fixed value for google login
    const discoveryUrl = 'https://accounts.google.com/.well-known/openid-configuration';

    // authorize the user by opening the concent page
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
      throw 'No result';
    }

    // Request the access and id token to google
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

    accessToken = tokenResult?.accessToken;
    idToken = tokenResult?.idToken;
  } else {
    final googleSignIn = GoogleSignIn(
      serverClientId: clientId,
      scopes: [
        'openid',
        'email',
        'profile',
      ],
    );

    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;
    accessToken = googleAuth?.accessToken;
    idToken = googleAuth?.idToken;
  }

  if (idToken == null) {
    throw 'No ID Token';
  }
  if (accessToken == null) {
    throw 'No Access Token';
  }

  final supabase = ref.watch(supabaseProvider);
  return supabase.auth.signInWithIdToken(
    provider: sb.Provider.google,
    idToken: idToken,
    accessToken: accessToken,
    nonce: rawNonce,
  );
}

/// 로그아웃해요.
@riverpod
Future<void> signOut(
  SignOutRef ref,
) async {
  final supabase = ref.watch(supabaseProvider);
  // TODO 구글 로그아웃 적용하기
  await supabase.auth.signOut();
}

/// 회원탈퇴해요.
@riverpod
Future<void> deleteUser(
  DeleteUserRef ref,
) async {
  // TODO 회원탈퇴, 권한 없어서 에러 뜨는듯
  final userId = ref.watch(requireUserIdProvider);
  final supabase = ref.watch(supabaseProvider);
  await supabase.auth.admin.deleteUser(userId);
}

/// 사용자 식별자를 가져와요.
@Riverpod(keepAlive: true)
UserID? currentUserId(
  CurrentUserIdRef ref,
) {
  final auth = ref.watch(supabaseProvider.select((_) => _.auth));
  return auth.currentSession?.user.id;
}

/// 사용자 식별자를 엄격히 가져와요.
@Riverpod(keepAlive: true)
UserID requireUserId(
  RequireUserIdRef ref,
) {
  final userId = ref.watch(currentUserIdProvider);
  if (userId == null) throw const UnauthorizedException();
  return userId;
}
