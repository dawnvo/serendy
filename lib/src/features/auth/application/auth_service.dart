import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:serendy/src/core/exceptions/auth_exception.dart';
import 'package:serendy/src/core/exceptions/core_exception.dart';
import 'package:serendy/src/core/infrastructure/infrastructure_module.dart';
import 'package:serendy/src/features/user/user.dart';

part 'auth_service.g.dart';

/// Auth Service
class AuthService {
  const AuthService(
    this._firebaseAuth,
    this._googleSignIn,
  );

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  /// 이벤트 트리거
  Stream<UserID?> get authStateChanges {
    return _firebaseAuth.authStateChanges().map((event) => event?.uid);
  }

  /// 사용자 식별
  UserID? get currentUserId => _firebaseAuth.currentUser?.uid;

  /// 회원 탈퇴
  Future<void> delete() async {
    await _firebaseAuth.currentUser?.delete();
  }

  /// 구글 로그아웃
  Future<void> signOutWithGoogle() async {
    await Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  /// 구글 로그인
  Future<UserCredential> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await _firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
}

@Riverpod(keepAlive: true)
AuthService authService(AuthServiceRef ref) {
  return AuthService(
    InfrastructureModule.auth,
    InfrastructureModule.googleSignIn,
  );
}

@Riverpod(keepAlive: true)
UserID requireUserId(RequireUserIdRef ref) {
  final userId = ref.watch(authServiceProvider.select((_) => _.currentUserId));
  if (userId == null) throw const UnauthorizedException();
  return userId;
}

@riverpod
UserID? userId(UserIdRef ref) {
  final userId = ref.watch(authServiceProvider.select((_) => _.currentUserId));
  return userId;
}
