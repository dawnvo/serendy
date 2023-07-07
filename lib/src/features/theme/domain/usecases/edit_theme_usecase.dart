import 'package:serendy/src/core/domain/assert.dart';
import 'package:serendy/src/core/domain/usecase.dart';
import 'package:serendy/src/core/exceptions/core_exception.dart';
import 'package:serendy/src/core/persistence/file_storage.dart';
import 'package:serendy/src/features/theme/theme.dart';

typedef EditThemePayload = ({
  String executorId,
  String themeId,
  String? title,
  String? description,
  String? image,
  bool? private,
});

final class EditThemeUsecase implements UseCase<EditThemePayload, Theme> {
  const EditThemeUsecase(
    this._themeRepository,
    this._fileStorage,
  );

  final ThemeRepository _themeRepository;
  final FileStorage _fileStorage;

  @override
  Future<Theme> execute(EditThemePayload payload) async {
    // 테마를 찾을 수 없으면 예외 처리
    final theme = CoreAssert.notEmpty<Theme>(
      await _themeRepository.findOne(payload.themeId),
      const EntityNotFoundException(overrideMessage: "테마를 찾을 수 없어요."),
    );

    // 권한이 없으면 예외 처리
    final hasAccess = payload.executorId == theme.owner.id;
    CoreAssert.isTrue(hasAccess, const AccessDeniedException());

    // 이미지가 있고, 이전과 다른 이미지라면 스토리지에 업로드를 진행합니다.
    String? downloadUrl;
    if (payload.image != null &&
        payload.image != '' &&
        payload.image != theme.image) {
      downloadUrl = await _fileStorage.upload(theme.id, payload.image!);
    }

    // 데이터베이스에 있는 테마를 수정합니다.
    final edited = theme.edit(
      title: payload.title,
      description: payload.description,
      image: downloadUrl,
      private: payload.private,
    );

    await _themeRepository.update(edited);

    return edited;
  }
}
