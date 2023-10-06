import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/theme/theme.dart';

typedef GetThemeItemsPayload = ({
  String themeId,
});

final class GetThemeItemsUsecase implements UseCase<GetThemeItemsPayload, List<ThemeItem?>> {
  const GetThemeItemsUsecase(this._themeRepository);
  final ThemeRepository _themeRepository;

  @override
  Future<List<ThemeItem?>> execute(GetThemeItemsPayload payload) async {
    final themeItems = await _themeRepository.fetchItems(id: payload.themeId);
    return themeItems;
  }
}
