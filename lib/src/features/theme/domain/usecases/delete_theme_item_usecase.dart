import 'package:serendy/src/core/domain/assert.dart';
import 'package:serendy/src/core/domain/usecase.dart';
import 'package:serendy/src/core/exceptions/core_exception.dart';
import 'package:serendy/src/features/theme/theme.dart';

typedef DeleteThemeItemPayload = ({
  String executorId,
  String themeId,
  String mediaId,
});

final class DeleteThemeItemUsecase
    implements UseCase<DeleteThemeItemPayload, Theme> {
  const DeleteThemeItemUsecase(this._themeRepository);
  final ThemeRepository _themeRepository;

  @override
  Future<Theme> execute(DeleteThemeItemPayload payload) async {
    // 테마를 찾을 수 없으면 예외 처리
    final theme = CoreAssert.notEmpty<Theme>(
      await _themeRepository.findOne(payload.themeId),
      const EntityNotFoundException(),
    );

    // 권한이 없으면 예외 처리
    final hasAccess = payload.executorId == theme.owner.id;
    CoreAssert.isTrue(hasAccess, const AccessDeniedException());

    final deletedItem = theme.deleteItem(payload.mediaId);

    await _themeRepository.deleteItem(deletedItem, payload.mediaId);

    return deletedItem;
  }
}
