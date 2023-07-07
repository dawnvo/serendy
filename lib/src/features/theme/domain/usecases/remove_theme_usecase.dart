import 'package:serendy/src/core/domain/assert.dart';
import 'package:serendy/src/core/domain/usecase.dart';
import 'package:serendy/src/core/exceptions/core_exception.dart';
import 'package:serendy/src/core/persistence/file_storage.dart';
import 'package:serendy/src/features/theme/theme.dart';

typedef RemoveThemePayload = ({
  String executorId,
  String themeId,
});

final class RemoveThemeUsecase implements UseCase<RemoveThemePayload, void> {
  const RemoveThemeUsecase(
    this._themeRepository,
    this._fileStorage,
  );

  final ThemeRepository _themeRepository;
  final FileStorage _fileStorage;

  @override
  Future<void> execute(RemoveThemePayload payload) async {
    // 테마를 찾을 수 없으면 예외 처리
    final theme = CoreAssert.notEmpty<Theme>(
      await _themeRepository.fetchTheme(payload.themeId),
      const EntityNotFoundException(overrideMessage: "테마를 찾을 수 없어요."),
    );

    // 권한이 없으면 예외 처리
    final hasAccess = payload.executorId == theme.owner.id;
    CoreAssert.isTrue(hasAccess, const AccessDeniedException());

    // 테마에 이미지가 있으면 스토리지에서 이미지를 제거합니다.
    if (theme.image != null) {
      await _fileStorage.delete(theme.id);
    }

    final removed = theme.remove();
    await _themeRepository.update(removed);
  }
}
