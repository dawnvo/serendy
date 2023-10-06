import 'package:serendy/src/configs/_mockup.dart';
import 'package:serendy/src/features/profile/profile.dart';

final class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl();

  /**
   * 사용자 정보를 불러와요.
   */
  @override
  Future<Profile?> fetchProfile({
    required UserID id,
  }) async {
    return profileMock;
  }

  /**
   * 사용자를 만들어요.
   */
  @override
  Future<void> createProfile(Profile profile) async {
    throw UnimplementedError();
  }

  /**
   * 사용자를 갱신해요.
   */
  @override
  Future<void> updateProfile(Profile profile) async {
    throw UnimplementedError();
  }
}
