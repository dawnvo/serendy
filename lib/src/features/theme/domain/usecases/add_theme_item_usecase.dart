import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';
import 'package:serendy/src/features/theme/theme.dart';

typedef AddThemeItemPayload = ({
  UserID executorId,
  String themeId,
  MediaID mediaId,
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
    // * 테마가 존재하는지 확인해요.
    final theme = CoreAssert.notEmpty<Theme>(
      await _themeRepository.fetchThemeSlice(id: payload.themeId),
      const EntityNotFoundException(overrideMessage: "테마를 찾을 수 없어요."),
    );

    // * 올바른 실행자인지 확인해요.
    final hasAccess = payload.executorId == theme.owner.id;
    CoreAssert.isTrue(hasAccess, const AccessDeniedException());

    // * 작품이 존재하는지 확인해요.
    final media = CoreAssert.notEmpty<Media>(
      await _mediaRepository.fetchMediaSlice(id: payload.mediaId),
      const EntityNotFoundException(overrideMessage: "작품을 찾을 수 없어요."),
    );

    // * 테마에 항목을 추가해요.
    final itemAdded = theme.addItem(ThemeItem(
      addedAt: DateTime.now(),
      mediaId: media.id,
      title: media.title,
      image: media.image,
    ));

    // * commit
    await _themeRepository.addItem(
      themeId: itemAdded.id,
      mediaId: payload.mediaId,
    );
    return itemAdded;
  }
}
