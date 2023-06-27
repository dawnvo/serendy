import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/features/media/media.dart';

part 'search_controller.g.dart';
part 'search_state.dart';

@riverpod
class SearchController extends _$SearchController {
  @override
  FutureOr<SearchState> build() async {
    return const SearchState();
  }

  Future<void> searchMedias(String text) async {
    state = const AsyncLoading();

    if (text.isEmpty) {
      state = AsyncData(state.requireValue.copyWith(medias: []));
      return;
    }

    final newState = await AsyncValue.guard(() async {
      final medias = await ref.watch(searchMediaProvider(title: text).future);
      return state.requireValue.copyWith(medias: medias);
    });

    state = newState;
  }
}
