import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';

part 'home_controller.g.dart';
part 'home_state.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<HomeState> build() async {
    // * 추천 작품을 불러와요.
    // TODO: [최신/인기/완결] 필터 구현하기
    final medias = await ref.watch(getMediasProvider.future);

    // * loaded
    return HomeState(medias: medias);
  }
}
