import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/features/collection/collection.dart';

part 'collection_controller.g.dart';

class _CollectionState extends Equatable {
  const _CollectionState({required this.collection});

  final Collection collection;

  @override
  List<Object?> get props => [collection];
}

@riverpod
class CollectionController extends _$CollectionController {
  @override
  FutureOr<_CollectionState> build(CollectionID id) async {
    final collection = await ref.watch(fetchCollectionProvider(id: id).future);
    return _CollectionState(collection: collection);
  }
}
