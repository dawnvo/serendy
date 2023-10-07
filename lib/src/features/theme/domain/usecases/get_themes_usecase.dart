import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/theme/theme.dart';

typedef GetThemesPayload = ({
  String? executorId,
});

final class GetThemesUsecase implements UseCase<GetThemesPayload, List<Theme?>> {
  const GetThemesUsecase(this._themeRepository);
  final ThemeRepository _themeRepository;

  @override
  Future<List<Theme?>> execute(GetThemesPayload payload) async {
    final themes = await _themeRepository.fetchThemes(
      userId: payload.executorId,
    );
    return themes;
  }
}
