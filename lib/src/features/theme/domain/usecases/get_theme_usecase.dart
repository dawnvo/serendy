import 'package:serendy/src/core/domain/assert.dart';
import 'package:serendy/src/core/domain/usecase.dart';
import 'package:serendy/src/core/exceptions/core_exception.dart';
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
    // 테마를 찾을 수 없으면 예외 처리
    final theme = CoreAssert.notEmpty<Theme>(
      await _themeRepository.fetchTheme(payload.themeId),
      const EntityNotFoundException(overrideMessage: "테마를 찾을 수 없어요."),
    );

    // 테마가 비공개 상태라면 소유자만 조회할 수 있습니다.
    final hasAccess =
        theme.private == false || payload.executorId == theme.owner.id;
    CoreAssert.isTrue(hasAccess, const AccessDeniedException());

    return theme;
  }
}
