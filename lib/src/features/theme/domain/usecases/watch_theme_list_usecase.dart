import 'package:serendy/src/core/domain/usecase.dart';
import 'package:serendy/src/features/theme/theme.dart';

typedef WatchThemeListPayload = ({
  String userId,
});

final class WatchThemeListUsecase
    implements StreamUseCase<WatchThemeListPayload, List<Theme?>> {
  const WatchThemeListUsecase(this._themeRepository);
  final ThemeRepository _themeRepository;

  @override
  Stream<List<Theme?>> execute(WatchThemeListPayload payload) {
    final themes = _themeRepository.watchMany(payload.userId);
    return themes;
  }
}
