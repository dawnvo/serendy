import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/profile/profile.dart';
import 'package:serendy/src/features/theme/theme.dart';

typedef RemoveThemePayload = ({
  UserID executorId,
  String themeId,
});

final class RemoveThemeUsecase implements UseCase<RemoveThemePayload, void> {
  const RemoveThemeUsecase(this._themeRepository);
  final ThemeRepository _themeRepository;

  @override
  Future<void> execute(RemoveThemePayload payload) async {
    // * 테마가 존재하는지 확인해요.
    final theme = CoreAssert.notEmpty<Theme>(
      await _themeRepository.fetchThemeSlice(id: payload.themeId),
      const EntityNotFoundException(overrideMessage: "테마를 찾을 수 없어요."),
    );

    // * 올바른 실행자인지 확인해요.
    final hasAccess = payload.executorId == theme.owner.id;
    CoreAssert.isTrue(hasAccess, const AccessDeniedException());

    // TODO: 사진을 삭제해요.
    // if (theme.image != null) {}

    // * 테마를 삭제해요.
    final removed = theme.remove();

    // * commit
    await _themeRepository.updateTheme(removed);
  }
}
