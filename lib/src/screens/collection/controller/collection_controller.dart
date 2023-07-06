import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/features/collection/collection.dart';
import 'package:serendy/src/features/user/user.dart';

part 'collection_controller.g.dart';
part 'collection_state.dart';

@riverpod
class CollectionController extends _$CollectionController {
  @override
  FutureOr<CollectionState> build(CollectionID id) async {
    final collection = await ref.watch(fetchCollectionProvider(id: id).future);
    final owner = await ref.watch(fetchUserProvider(
      id: collection.owner.id,
    ).future);

    return CollectionState(
      collection: collection,
      owner: owner,
    );
  }

  Future<void> collectionUpdated(Collection collection) async {
    // * 컨트롤러를 초기화한 경우에만 상태를 설정해요.
    if (!state.hasValue) return;
    state = AsyncData(state.requireValue.copyWith(collection: collection));
  }
}
