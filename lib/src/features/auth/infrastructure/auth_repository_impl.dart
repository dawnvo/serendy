import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:serendy/env.dart';

class AuthRepositoryImpl {
  const AuthRepositoryImpl(
    this.supabase,
    this.googleSignIn,
  );

  final SupabaseClient supabase;
  final GoogleSignIn googleSignIn;

  /**
   * 인증 상태를 감시해요.
   */
  Stream<sb.User?> authStateChange() => supabase //
      .auth
      .onAuthStateChange
      .map((event) => event.session?.user);

  /**
   * 인증 정보를 불러와요.
   */
  sb.User? get currentUser => supabase.auth.currentUser;

  /**
   * 구글 로그아웃해요.
   */
  Future<void> signOutWithGoogle() async {
    await googleSignIn.signOut();
    await supabase.auth.signOut();
  }

  /**
   * 구글 로그인해요.
   */
  Future<sb.User?> signInWithGoogle() async {
    // * Client ID that you registered with Google Cloud.
    final clientId = Platform.isIOS //
        ? Env.googleClientIdIos
        : Env.googleClientIdWeb;

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

    if (idToken == null) return null;
    if (accessToken == null) {
      throw 'No Access Token';
    }

    return supabase.auth
        .signInWithIdToken(
          provider: sb.Provider.google,
          idToken: idToken,
          accessToken: accessToken,
          nonce: rawNonce,
        )
        .then((_) => _.user);
  }
}
