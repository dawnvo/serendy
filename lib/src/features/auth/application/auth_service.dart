import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/user/user.dart';

part 'auth_service.g.dart';

/// 구글 로그인을 진행해요.
@riverpod
Future<AuthResponse> signInWithGoogle(
  SignInWithGoogleRef ref,
) async {
  // * Client ID that you registered with Google Cloud.
  final clientId = Platform.isIOS //
      ? dotenv.env["GOOGLE_CLIENT_ID_IOS"] as String
      : dotenv.env["GOOGLE_CLIENT_ID_WEB"] as String;

  final scopes = [
    'openid',
    'email',
  ];

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
        scopes: scopes,
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
        scopes: scopes,
      ),
    );

    accessToken = tokenResult?.accessToken;
    idToken = tokenResult?.idToken;
  } else {
    final googleSignIn = GoogleSignIn(
      serverClientId: clientId,
      scopes: scopes,
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

  final supabase = ref.watch(supabaseClientProvider);
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
  final supabase = ref.watch(supabaseClientProvider);
  await supabase.auth.signOut();
}

/// 구글 로그아웃해요.
@riverpod
Future<void> signOutWithGoogle(
  SignOutWithGoogleRef ref,
) async {
  await ref.read(signOutProvider.future);
  final googleSignIn = GoogleSignIn();
  await googleSignIn.signOut();
}

/// 계정을 삭제해요.
@riverpod
Future<void> deleteAuthUser(
  DeleteAuthUserRef ref,
) async {
  final userId = ref.watch(requireUserIdProvider);
  final supabaseAdmin = ref.watch(supabaseAdminProvider);
  await supabaseAdmin.auth.admin.deleteUser(userId);
}

/// 사용자 식별자를 가져와요.
@Riverpod(keepAlive: true)
UserID? currentUserId(
  CurrentUserIdRef ref,
) {
  final auth = ref.watch(supabaseClientProvider.select((_) => _.auth));
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
