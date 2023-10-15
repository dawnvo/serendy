import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/profile/profile.dart';
import 'package:serendy/src/features/theme/theme.dart';

typedef CreateThemePayload = ({
  UserID executorId,
  String title,
});

final class CreateThemeUsecase implements UseCase<CreateThemePayload, Theme> {
  const CreateThemeUsecase(
    this._themeRepository,
    this._profileRepository,
  );

  final ThemeRepository _themeRepository;
  final ProfileRepository _profileRepository;

  @override
  Future<Theme> execute(CreateThemePayload payload) async {
    // * 프로필이 존재하는지 확인해요.
    final profile = CoreAssert.notEmpty<Profile>(
      await _profileRepository.fetchProfile(id: payload.executorId),
      const EntityNotFoundException(overrideMessage: "사용자를 찾을 수 없어요."),
    );

    // * 테마 인스턴스를 생성해요.
    final theme = Theme(
      owner: ThemeOwner(
        id: profile.id,
        name: profile.name,
        image: profile.image,
      ),
      title: payload.title,
    );

    // * commit
    await _themeRepository.createTheme(theme);
    return theme;
  }
}
