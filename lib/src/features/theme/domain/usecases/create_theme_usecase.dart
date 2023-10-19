import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/user/user.dart';
import 'package:serendy/src/features/theme/theme.dart';

typedef CreateThemePayload = ({
  UserID executorId,
  String title,
});

final class CreateThemeUsecase implements UseCase<CreateThemePayload, Theme> {
  const CreateThemeUsecase(
    this._themeRepository,
    this._userRepository,
  );

  final ThemeRepository _themeRepository;
  final UserRepository _userRepository;

  @override
  Future<Theme> execute(CreateThemePayload payload) async {
    // * 사용자가 존재하는지 확인해요.
    final user = CoreAssert.notEmpty<User>(
      await _userRepository.fetchUser(id: payload.executorId),
      const EntityNotFoundException(overrideMessage: "사용자를 찾을 수 없어요."),
    );

    // * 테마 인스턴스를 생성해요.
    final theme = Theme(
      owner: ThemeOwner(
        id: user.id,
        username: user.username,
      ),
      title: payload.title,
    );

    // * commit
    await _themeRepository.createTheme(theme);
    return theme;
  }
}
