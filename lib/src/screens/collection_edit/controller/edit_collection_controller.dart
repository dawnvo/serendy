import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/collection/collection.dart';

import '../../collection/controller/collection_controller.dart';

part 'edit_collection_controller.g.dart';
part 'edit_collection_state.dart';

@riverpod
class EditCollectionController extends _$EditCollectionController
    with NotifierMounted {
  @override
  EditCollectionState build(Collection collection) {
    ref.onDispose(setUnmounted);
    return EditCollectionState(
      initialCollection: collection,
      image: collection.image,
      title: collection.title,
      description: collection.description,
      private: collection.private,
    );
  }

  /// 이미지를 변경해요.
  void changeImage(String? imagePath) {
    state = state.copyWith(image: imagePath);
  }

  /// 제목을 수정해요.
  void changeTitle(String title) {
    state = state.copyWith(title: title);
  }

  /// 설명을 수정해요.
  void changeDescription(String description) {
    state = state.copyWith(description: description);
  }

  /// 상태를 변경해요.
  void changePrivacyStatus(bool private) {
    state = state.copyWith(private: private);
  }

  /// 컬렉션을 수정해요.
  Future<void> submit() async {
    state = state.copyWith(status: EditCollectionStatus.loading);

    try {
      // * 컬렉션을 수정해요.
      await ref.read(editCollectionProvider(
        id: collection.id,
        image: state.image,
        title: state.title,
        description: state.description,
        private: state.private,
      ).future);

      // * 컬렉션 화면의 상태를 갱신해요.
      ref
          .read(collectionControllerProvider(collection.id).notifier)
          .collectionUpdated();

      // * 컨트롤러가 폐기되지 않은 경우에만 상태를 설정해요.
      if (!mounted) return;
      state = state.copyWith(status: EditCollectionStatus.success);

      // * 컬렉션 화면으로 돌아가요.
      ref.read(goRouterProvider).pop();
    } catch (err) {
      // * 에러가 발생하면 상태를 설정해요.
      state = state.copyWith(
        status: EditCollectionStatus.failure,
        errorMessage: err.toString(),
      );
    }
  }

  /// 컬렉션을 삭제해요.
  Future<void> delete() async {
    state = state.copyWith(status: EditCollectionStatus.loading);

    try {
      await ref.read(removeCollectionProvider(
        id: state.initialCollection.id,
      ).future);

      // * 컨트롤러가 폐기되지 않은 경우에만 상태를 설정해요.
      if (!mounted) return;
      state = state.copyWith(status: EditCollectionStatus.success);

      // * 프로필 화면으로 이동해요.
      ref.read(goRouterProvider).goNamed(AppRoutes.profileName);
    } catch (err) {
      // * 에러가 발생하면 상태를 설정해요.
      state = state.copyWith(
        status: EditCollectionStatus.failure,
        errorMessage: err.toString(),
      );
    }
  }
}
