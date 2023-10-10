import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/profile/profile.dart';
import 'package:serendy/src/features/theme/theme.dart';

typedef EditThemePayload = ({
  UserID executorId,
  String themeId,
  String? title,
  String? image,
  bool? private,
  String? description,
});

final class EditThemeUsecase implements UseCase<EditThemePayload, Theme> {
  const EditThemeUsecase(this._themeRepository);
  final ThemeRepository _themeRepository;

  @override
  Future<Theme> execute(EditThemePayload payload) async {
    // * 테마가 존재하는지 확인해요.
    final theme = CoreAssert.notEmpty<Theme>(
      await _themeRepository.fetchThemeSlice(id: payload.themeId),
      const EntityNotFoundException(overrideMessage: "테마를 찾을 수 없어요."),
    );

    // * 올바른 실행자인지 확인해요.
    final hasAccess = payload.executorId == theme.owner.id;
    CoreAssert.isTrue(hasAccess, const AccessDeniedException());

    // * 이미지를 변경했다면 업로드를 진행해요.
    String? imageUrl;
    if (payload.image != theme.image) {
      imageUrl = await _themeRepository.uploadThemeImage(
        theme.copy(image: payload.image), // 변경한 이미지로 교체
      );
    }

    // * 테마 정보를 수정해요.
    final edited = theme.edit(
      image: imageUrl,
      title: payload.title,
      private: payload.private,
      description: payload.description,
    );

    // * commit
    await _themeRepository.updateTheme(edited);
    return edited;
  }
}
