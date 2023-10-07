import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/profile/profile.dart';
import 'package:serendy/src/features/theme/theme.dart';

typedef WatchThemesPayload = ({
  UserID userId,
});

final class WatchThemesUsecase implements StreamUseCase<WatchThemesPayload, List<Theme?>> {
  const WatchThemesUsecase(this._themeRepository);
  final ThemeRepository _themeRepository;

  @override
  Stream<List<Theme?>> execute(WatchThemesPayload payload) {
    final themes = _themeRepository.watchThemes(userId: payload.userId);
    return themes;
  }
}
