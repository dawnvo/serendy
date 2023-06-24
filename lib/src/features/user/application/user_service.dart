import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/user/user.dart';

part 'user_service.g.dart';

/// 사용자 정보를 불러와요.
@riverpod
Future<User> fetchUser(
  FetchUserRef ref, {
  required String userId,
}) {
  return UserModule.getUserUsecase.execute((userId: userId));
}

/// 사용자를 만들어요.
@riverpod
Future<User> createUser(
  CreateUserRef ref, {
  required String authId,
  required String name,
  String? email,
  String? avatar,
}) {
  return UserModule.createUserUsecase.execute((
    id: authId,
    name: name,
    email: email,
    avatar: avatar,
  ));
}

/// 프로필을 수정해요.
@riverpod
Future<User> editProfile(
  EditProfileRef ref, {
  String? name,
  String? avatar,
}) {
  final userId = ref.watch(requireUserIdProvider);
  return UserModule.editProfileUsecase.execute((
    executorId: userId,
    name: name,
    avatar: avatar,
  ));
}

/// 사용자를 제거해요.
@riverpod
Future<void> removeUser(
  RemoveUserRef ref, {
  required String id,
  String? reason,
}) {
  final userId = ref.watch(requireUserIdProvider);
  return UserModule.removeUserUsecase.execute((
    executorId: userId,
    reason: reason,
  ));
}