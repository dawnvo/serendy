sealed class AuthException implements Exception {}

/// Thrown during the sign in with google process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithCredential.html
final class SignInWithGoogleFailure implements AuthException {
  const SignInWithGoogleFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory SignInWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'network_error':
        return const SignInWithGoogleFailure(
          'Network Error',
        );
      case 'account-exists-with-different-credential':
        return const SignInWithGoogleFailure(
          'Account exists with different credentials.',
        );
      case 'invalid-credential':
        return const SignInWithGoogleFailure(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const SignInWithGoogleFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return const SignInWithGoogleFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const SignInWithGoogleFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const SignInWithGoogleFailure(
          'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return const SignInWithGoogleFailure(
          'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return const SignInWithGoogleFailure(
          'The credential verification ID received is invalid.',
        );
      default:
        return const SignInWithGoogleFailure();
    }
  }

  final String message;
}

/// Thrown during the logout process if a failure occurs.
final class SignOutFailure implements AuthException {
  const SignOutFailure();
}
