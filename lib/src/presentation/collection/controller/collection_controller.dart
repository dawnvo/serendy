import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/features/collection/collection.dart';

part 'collection_controller.g.dart';
part 'collection_state.dart';

@riverpod
class CollectionController extends _$CollectionController {
  @override
  FutureOr<CollectionState> build(CollectionID id) async {
    final collection = await ref.watch(fetchCollectionProvider(id: id).future);
    return CollectionState(collection: collection);
  }
}
