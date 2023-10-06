import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/profile/profile.dart';
import 'package:serendy/src/features/theme/theme.dart';

typedef WatchThemeListPayload = ({
  UserID userId,
});

final class WatchThemeListUsecase implements StreamUseCase<WatchThemeListPayload, List<Theme?>> {
  const WatchThemeListUsecase(this._themeRepository);
  final ThemeRepository _themeRepository;

  @override
  Stream<List<Theme?>> execute(WatchThemeListPayload payload) {
    final themes = _themeRepository.watchThemesList(userId: payload.userId);
    return themes;
  }
}
