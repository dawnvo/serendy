import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/user/user.dart';

part 'user_service.g.dart';

/// 나의 사용자를 불러와요.
@Riverpod(keepAlive: true)
Future<User> getMe(GetMeRef ref) {
  final userId = ref.watch(requireUserIdProvider);
  return UserModule.getUserUsecase.execute((userId: userId));
}

/// 사용자를 불러와요.
@riverpod
Future<User> getUser(
  GetUserRef ref, {
  required UserID id,
}) {
  return UserModule.getUserUsecase.execute((userId: id));
}

/// 사용자를 만들어요.
@riverpod
Future<User> createUser(
  CreateUserRef ref, {
  required UserID uid,
  required String email,
  required String username,
}) {
  return UserModule.createUserUsecase.execute((
    id: uid,
    name: username,
    email: email,
  ));
}

/// 프로필을 수정해요.
@riverpod
Future<User> editProfile(
  EditProfileRef ref, {
  String? username,
}) {
  final userId = ref.watch(requireUserIdProvider);
  return UserModule.editProfileUsecase.execute((
    executorId: userId,
    username: username,
  ));
}

/// 사용자를 제거해요.
@riverpod
Future<void> deleteUser(
  DeleteUserRef ref, {
  required ExitReason reason,
  String? comment,
}) {
  final userId = ref.watch(requireUserIdProvider);
  return UserModule.deleteUserUsecase.execute((
    executorId: userId,
    reason: reason,
    comment: comment,
  ));
}
