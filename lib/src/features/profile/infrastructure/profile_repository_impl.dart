import 'package:serendy/src/configs/_mockup.dart';
import 'package:serendy/src/features/profile/profile.dart';

final class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl();

  /**
   * 프로필을 불러와요.
   */
  @override
  Future<Profile?> fetchProfile({
    required UserID id,
  }) async {
    return profileMock;
  }

  /**
   * 프로필을 만들어요.
   */
  @override
  Future<void> createProfile(
    Profile profile,
  ) async {
    throw UnimplementedError();
  }

  /**
   * 프로필을 갱신해요.
   */
  @override
  Future<void> updateProfile(
    Profile profile,
  ) async {
    throw UnimplementedError();
  }
}
