import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/user/user.dart';

part 'user_service.g.dart';

/// 사용자 이름이 존재하는지 확인해요.
/// 존재하면 True.
@riverpod
Future<String?> checkUsername(
  CheckUsernameRef ref, {
  required String username,
}) async {
  // * 문자열을 검증해요.
  if (username.contains(RegExp(r'[^a-zA-Z0-9_]+'))) {
    return '영문자, 숫자 및 밑줄(_)만 사용 가능해요.';
  }

  // * 문자 수를 검증해요.
  if (username.length < 3) {
    return "아이디는 3자 이상이어야 해요.";
  }

  final isUsernameTaken = await UserModule.checkUsernameUsecase.execute((
    username: username, //
  ));

  if (isUsernameTaken) {
    return "이미 사용 중인 아이디에요.";
  }

  return null;
}

/// 내 정보를 불러와요.
@Riverpod(keepAlive: true)
Future<User> getMe(GetMeRef ref) {
  final userId = ref.watch(requireUserIdProvider);
  return UserModule.getUserUsecase.execute((
    userId: userId, //
  ));
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
