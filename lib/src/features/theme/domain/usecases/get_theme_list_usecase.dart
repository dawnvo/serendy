import 'package:serendy/src/core/domain/usecase.dart';
import 'package:serendy/src/features/theme/theme.dart';

typedef GetThemeListPayload = ({
  String? executorId,
});

final class GetThemeListUsecase
    implements UseCase<GetThemeListPayload, List<Theme?>> {
  const GetThemeListUsecase(this._themeRepository);
  final ThemeRepository _themeRepository;

  @override
  Future<List<Theme?>> execute(GetThemeListPayload payload) async {
    final themes = await _themeRepository.findMany(payload.executorId);
    return themes.where((theme) {
      return theme?.private == false || theme?.owner.id == payload.executorId;
    }).toList();
  }
}
