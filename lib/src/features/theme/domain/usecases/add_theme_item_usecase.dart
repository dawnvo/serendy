import 'package:serendy/src/core/domain/assert.dart';
import 'package:serendy/src/core/domain/usecase.dart';
import 'package:serendy/src/core/exceptions/core_exception.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/features/media/media.dart';

typedef AddThemeItemPayload = ({
  String executorId,
  String themeId,
  String mediaId,
});

final class AddThemeItemUsecase implements UseCase<AddThemeItemPayload, Theme> {
  const AddThemeItemUsecase(
    this._themeRepository,
    this._mediaRepository,
  );

  final ThemeRepository _themeRepository;
  final MediaRepository _mediaRepository;

  @override
  Future<Theme> execute(AddThemeItemPayload payload) async {
    // 테마를 찾을 수 없으면 예외 처리
    final theme = CoreAssert.notEmpty<Theme>(
      await _themeRepository.fetchTheme(payload.themeId),
      const EntityNotFoundException(overrideMessage: "테마를 찾을 수 없어요."),
    );

    // 권한이 없으면 예외 처리
    final hasAccess = payload.executorId == theme.owner.id;
    CoreAssert.isTrue(hasAccess, const AccessDeniedException());

    // 미디어를 찾을 수 없으면 예외 처리
    final media = CoreAssert.notEmpty<Media>(
      await _mediaRepository.findOne(payload.mediaId),
      const EntityNotFoundException(overrideMessage: "미디어를 찾을 수 없어요."),
    );

    final addedItem = theme.addItem(ThemeItem(
      addedAt: DateTime.now(),
      media: Media(
        id: media.id,
        type: media.type,
        status: media.status,
        title: media.title,
        image: media.image,
        images: media.images,
        keywords: media.keywords,
        synopsis: media.synopsis,
        youtubeId: media.youtubeId,
        isAdult: media.isAdult,
        startDate: media.startDate,
        endDate: media.endDate,
      ),
    ));

    await _themeRepository.addItem(addedItem, payload.mediaId);

    return addedItem;
  }
}
