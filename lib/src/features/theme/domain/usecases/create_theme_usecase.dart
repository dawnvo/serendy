import 'package:serendy/src/core/domain/assert.dart';
import 'package:serendy/src/core/domain/usecase.dart';
import 'package:serendy/src/core/exceptions/core_exception.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/features/user/user.dart';

typedef CreateThemePayload = ({
  String executorId,
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
    // 사용자를 찾을 수 없으면 예외 처리
    final user = CoreAssert.notEmpty<User>(
      await _userRepository.findOne(payload.executorId),
      const EntityNotFoundException(overrideMessage: "사용자를 찾을 수 없어요."),
    );

    // 데이터베이스에 새로운 테마를 생성합니다.
    final theme = Theme(
      owner: ThemeOwner(
        id: payload.executorId,
        name: user.name,
      ),
      title: payload.title,
    );

    await _themeRepository.create(theme);

    return theme;
  }
}
