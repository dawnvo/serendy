import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/theme/theme.dart';

typedef GetThemePayload = ({
  String? executorId,
  String themeId,
});

final class GetThemeUsecase implements UseCase<GetThemePayload, Theme> {
  const GetThemeUsecase(this._themeRepository);
  final ThemeRepository _themeRepository;

  @override
  Future<Theme> execute(GetThemePayload payload) async {
    // * 테마가 존재하는지 확인해요.
    final theme = CoreAssert.notEmpty<Theme>(
      await _themeRepository.fetchTheme(id: payload.themeId),
      const EntityNotFoundException(overrideMessage: "테마를 찾을 수 없어요."),
    );

    // * 비공개 테마는 소유자만 조회할 수 있어요.
    final hasAccess = theme.private == false || payload.executorId == theme.owner.id;
    CoreAssert.isTrue(hasAccess, const AccessDeniedException());

    return theme;
  }
}
