import 'package:serendy/src/features/profile/profile.dart';

abstract class ProfileRepository {
  const ProfileRepository();

  /// 프로필을 불러와요.
  Future<Profile?> fetchProfile({
    required UserID id,
  });

  /// 프로필을 만들어요.
  Future<void> createProfile(
    Profile profile,
  );

  /// 프로필을 갱신해요.
  Future<void> updateProfile(
    Profile profile,
  );
}
