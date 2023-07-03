import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
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

  Future<void> searchMedias(String text) async {
    state = const AsyncLoading();

    if (text.isEmpty) return clearMedias();

    final newState = await AsyncValue.guard(() async {
      final medias = await ref.watch(searchMediaProvider(title: text).future);
      return state.requireValue.copyWith(medias: medias);
    });

    state = newState;
  }

  void clearMedias() {
    state = AsyncData(state.requireValue.copyWith(medias: []));
  }
}

/// 검색어 입력 컨트롤러
final queryControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
  final controller = TextEditingController();
  final debouncer = ref.watch(debouncerProvider);

  String lastValue = "";
  controller.addListener(() async {
    // * 마지막 검색어와 동일하면 검색 요청을 무시해요.
    if (lastValue == controller.text) return;
    lastValue = controller.text;

    // * 검색을 요청해요.
    debouncer.run(() => ref
        .read(searchControllerProvider.notifier)
        .searchMedias(controller.text));
  });

  // * 컨트롤러를 초기화해요.
  ref.onDispose(() {
    controller.dispose();
  });

  return controller;
});
