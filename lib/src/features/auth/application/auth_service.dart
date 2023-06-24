import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:serendy/src/core/exceptions/auth_exception.dart';
import 'package:serendy/src/core/exceptions/core_exception.dart';
import 'package:serendy/src/core/infrastructure/infrastructure_module.dart';
import 'package:serendy/src/features/user/user.dart';

part 'auth_service.g.dart';

/// Interface
abstract class IAuthStrategy {
  Future<UserCredential?> signIn(FirebaseAuth firebaseAuth);
}

/// Auth Service
class AuthService {
  const AuthService(this._auth);
  final FirebaseAuth _auth;

  /// 이벤트 트리거
  Stream<UserID?> get authStateChanges {
    return _auth.authStateChanges().map((event) => event?.uid);
  }

  /// 사용자 식별
  UserID? get currentUserId => _auth.currentUser?.uid;

  /// 로그인
  Future<UserCredential?> signIn(IAuthStrategy strategy) async {
    final userCredential = await strategy.signIn(_auth);
    return userCredential;
  }

  /// 로그아웃
  Future<void> signOut() async {
    _auth.signOut();
  }

  /// 회원 탈퇴
  Future<void> delete() async {
    await _auth.currentUser?.delete();
  }
}

@Riverpod(keepAlive: true)
AuthService authService(AuthServiceRef ref) {
  return AuthService(InfrastructureModule.auth);
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
