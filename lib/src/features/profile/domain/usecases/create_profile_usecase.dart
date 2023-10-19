import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/profile/profile.dart';
import 'package:serendy/src/features/theme/theme.dart';

typedef CreateProfilePayload = ({
  UserID id,
  String name,
  String email,
});

final class CreateProfileUsecase implements UseCase<CreateProfilePayload, Profile> {
  const CreateProfileUsecase(
    this._profileRepository,
    this._themeRepository,
  );

  final ProfileRepository _profileRepository;
  final ThemeRepository _themeRepository;

  @override
  Future<Profile> execute(CreateProfilePayload payload) async {
    // * 프로필 인스턴스를 생성해요.
    final profile = Profile(
      id: payload.id,
      email: payload.email,
      username: payload.name,
    );

    // * commit
    await _profileRepository.createProfile(profile);
    await _createDefaultTheme(profile);
    return profile;
  }

  /**
   * '보고싶은' 테마를 만들어요.
   */
  Future<void> _createDefaultTheme(Profile profile) async {
    final theme = Theme(
      owner: ThemeOwner(id: profile.id, username: profile.username),
      image: Assets.themeFavoriteImage,
      title: '보고싶은',
      private: true,
      id: profile.id,
    );

    await _themeRepository.createTheme(theme);
  }
}
