import 'package:flutter/foundation.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/user/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

part 'auth_service.g.dart';

/// 인증 상태를 감시해요.
@Riverpod(keepAlive: true)
Stream<sb.User?> authStateChange(AuthStateChangeRef ref) {
  return ref.watch(authRepositoryProvider).authStateChange();
}

/// 사용자 식별자를 가져와요.
@Riverpod(keepAlive: true)
UserID? currentUserId(CurrentUserIdRef ref) {
  return ref.watch(authRepositoryProvider).currentUser?.id;
}

/// 사용자 식별자를 엄격히 가져와요.
@Riverpod(keepAlive: true)
UserID requireUserId(RequireUserIdRef ref) {
  final userId = ref.watch(currentUserIdProvider);
  if (userId == null) throw const UnauthorizedException();
  return userId;
}

/// 구글 로그인해요.
@riverpod
Future<sb.User?> signInWithGoogle(SignInWithGoogleRef ref) async {
  // * log analytics
  ref.read(firebaseAnalyticsProvider).logLogin(loginMethod: 'Google');
  return ref.read(authRepositoryProvider).signInWithGoogle();
}

/// 구글 로그아웃해요.
@riverpod
Future<void> signOutWithGoogle(SignOutWithGoogleRef ref) async {
  return ref.read(authRepositoryProvider).signOutWithGoogle();
}

/// 계정을 삭제해요.
@riverpod
Future<void> deleteAuth(DeleteAuthRef ref) async {
  if (kDebugMode) return;
  final userId = ref.watch(requireUserIdProvider);
  return ref.read(supabaseAdminProvider).auth.admin.deleteUser(userId);
}
