import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:serendy/src/features/auth/auth.dart';

/// Google 로그인
class GoogleStrategy implements IAuthStrategy {
  final _googleSignIn = GoogleSignIn();

  @override
  Future<UserCredential?> signIn(FirebaseAuth firebaseAuth) async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    if (googleAuth == null) return null;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await firebaseAuth.signInWithCredential(credential);
  }
}
