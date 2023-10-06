import 'package:serendy/src/core/domain/assert.dart';
import 'package:serendy/src/core/domain/usecase.dart';
import 'package:serendy/src/core/exceptions/core_exception.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/profile/profile.dart';
import 'package:serendy/src/features/theme/theme.dart';

typedef DeleteThemeItemPayload = ({
  UserID executorId,
  String themeId,
  MediaID mediaId,
});

final class DeleteThemeItemUsecase implements UseCase<DeleteThemeItemPayload, Theme> {
  const DeleteThemeItemUsecase(this._themeRepository);
  final ThemeRepository _themeRepository;

  @override
  Future<Theme> execute(DeleteThemeItemPayload payload) async {
    // * 테마가 존재하는지 확인해요.
    final theme = CoreAssert.notEmpty<Theme>(
      await _themeRepository.fetchThemeSlice(id: payload.themeId),
      const EntityNotFoundException(),
    );

    // * 올바른 실행자인지 확인해요.
    final hasAccess = payload.executorId == theme.owner.id;
    CoreAssert.isTrue(hasAccess, const AccessDeniedException());

    // * 테마의 항목을 삭제해요.
    final itemDeleted = theme.deleteItem(payload.mediaId);

    // * commit
    await _themeRepository.deleteItem(itemDeleted, payload.mediaId);
    return itemDeleted;
  }
}
