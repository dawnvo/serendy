import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:serendy/core/locator.dart';
import 'package:serendy/features/auth/application/services/auth_service.dart';

abstract final class AuthModule {
  static void dependencies() {
    sl.registerSingleton<AuthService>(
      AuthService(
        sl<FirebaseAuth>(),
        sl<GoogleSignIn>(),
      ),
    );
  }
}
