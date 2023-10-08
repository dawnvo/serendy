import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';

part 'search_controller.g.dart';
part 'search_state.dart';

@riverpod
class SearchController extends _$SearchController {
  @override
  FutureOr<SearchState> build() async {
    return const SearchState();
  }

  /// 미디어를 검색해요.
  Future<void> search(String text) async {
    // * 검색어가 없으면 검색결과를 제거해요.
    if (text.isEmpty) return clear();

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      // * 검색어에 부합하는 작품을 불러와요.
      final medias = await ref.watch(searchMediasProvider(
        title: text,
      ).future);

      return state.requireValue.copyWith(medias: medias);
    });
  }

  /// 검색결과를 제거해요.
  void clear() {
    state = AsyncValue.data(state.requireValue.copyWith(
      medias: [],
    ));
  }
}

@riverpod
// ignore: unsupported_provider_value
TextEditingController searchQueryController(SearchQueryControllerRef ref) {
  final controller = TextEditingController();
  final debouncer = ref.watch(debouncerProvider);

  String lastValue = "";
  controller.addListener(() {
    // * 마지막 검색어와 동일하면 검색 요청을 무시해요.
    if (lastValue == controller.text) return;
    lastValue = controller.text;

    // * 검색을 진행해요.
    debouncer.run(() => ref //
        .read(searchControllerProvider.notifier)
        .search(controller.text));
  });

  // * 컨트롤러가 폐기되면 같이 처분해요.
  ref.onDispose(controller.dispose);

  return controller;
}
