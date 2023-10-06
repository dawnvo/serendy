import 'package:serendy/src/features/profile/profile.dart';

abstract class ProfileRepository {
  const ProfileRepository();

  Future<Profile?> fetchProfile({
    required UserID id,
  });

  Future<void> createProfile(Profile profile);

  Future<void> updateProfile(Profile profile);
}
