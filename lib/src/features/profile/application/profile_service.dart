import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/profile/profile.dart';

part 'profile_service.g.dart';

/// 내 정보를 불러와요.
@Riverpod(keepAlive: true)
Future<Profile> fetchMe(FetchMeRef ref) {
  final userId = ref.watch(requireUserIdProvider);
  return ProfileModule.getProfileUsecase.execute((userId: userId));
}

/// 사용자 정보를 불러와요.
@riverpod
Future<Profile> fetchProfile(
  FetchProfileRef ref, {
  required UserID id,
}) {
  return ProfileModule.getProfileUsecase.execute((userId: id));
}

/// 사용자를 만들어요.
@riverpod
Future<Profile> createProfile(
  CreateProfileRef ref, {
  required UserID uid,
  required String username,
  required String email,
  String? avatar,
}) {
  return ProfileModule.createProfileUsecase.execute((
    id: uid,
    name: username,
    email: email,
    avatar: avatar,
  ));
}

/// 프로필을 수정해요.
@riverpod
Future<Profile> editProfile(
  EditProfileRef ref, {
  String? username,
  String? avatar,
}) {
  final userId = ref.watch(requireUserIdProvider);
  return ProfileModule.editProfileUsecase.execute((
    executorId: userId,
    name: username,
    avatar: avatar,
  ));
}

/// 사용자를 제거해요.
@riverpod
Future<void> removeProfile(
  RemoveProfileRef ref, {
  required UserID id,
  String? reason,
}) {
  final userId = ref.watch(requireUserIdProvider);
  return ProfileModule.removeProfileUsecase.execute((
    executorId: userId,
    reason: reason,
  ));
}
