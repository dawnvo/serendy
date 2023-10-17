import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';

part 'home_controller.g.dart';
part 'home_state.dart';

// TODO: [최신/인기/완결] 필터 구현하기

@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<HomeState> build() async {
    // * 추천 작품을 불러와요.
    final medias = await ref.watch(getMediasProvider().future);
    // * loaded
    return HomeState(medias: medias);
  }

  /// 탭을 변경해요.
  void setTab(HomeTab tab) {
    state = AsyncValue.data(state.requireValue.copyWith(
      tab: tab,
    ));
  }

  /// 작품을 더 불러와요.
  Future<void> fetchMore() async {
    // * 컨트롤러가 폐기된 경우 작업을 끝내요.
    if (!state.hasValue) return;

    final nextPage = state.requireValue.page + 1;
    final prevMedias = state.requireValue.medias;

    state = await AsyncValue.guard(() async {
      // * 미디어를 불러와요.
      final medias = await ref.watch(getMediasProvider(
        page: nextPage,
      ).future);

      // * loaded
      return state.requireValue.copyWith(
        page: nextPage,
        medias: [...prevMedias, ...medias],
      );
    });
  }
}
