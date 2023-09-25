import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/core/exceptions/core_exception.dart';
import 'package:serendy/src/features/user/user.dart';

part 'auth_service.g.dart';

@Riverpod(keepAlive: true)
UserID requireUserId(RequireUserIdRef ref) {
  const userId = 'hello';
  if (userId.isEmpty) throw const UnauthorizedException();
  return userId;
}

@riverpod
UserID? userId(UserIdRef ref) {
  const userId = 'hello';
  return userId;
}
