import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/collection/collection.dart';

part 'create_collection_controller.g.dart';
part 'create_collection_state.dart';

@riverpod
class CreateCollectionController extends _$CreateCollectionController
    with NotifierMounted {
  @override
  CreateCollectionState build() {
    ref.onDispose(setUnmounted);
    return CreateCollectionState(
      hintText: Assets.createCollectionHints.pickRandomly()!,
    );
  }

  /// 제목을 입력해요.
  void changeTitle(String title) {
    state = state.copyWith(title: title);
  }

  /// 컬렉션을 만들어요.
  Future<void> createCollection() async {
    state = state.copyWith(status: CreateCollectionStatus.loading);

    try {
      // * 제목을 입력하지 않으면 힌트가 제목을 대신해요.
      var title = state.title;
      if (title.isEmpty) title = state.hintText;

      await ref.read(createCollectionProvider(title: title).future);

      // * 컨트롤러가 폐기되지 않은 경우에만 상태를 설정해요.
      if (!mounted) return;
      state = state.copyWith(status: CreateCollectionStatus.success);

      // * 이전 화면으로 돌아가요.
      ref.read(goRouterProvider).pop();
    } catch (err) {
      // * 에러가 발생하면 상태를 설정해요.
      state = state.copyWith(
        status: CreateCollectionStatus.failure,
        errorMessage: err.toString(),
      );
    }
  }
}
