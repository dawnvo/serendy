part of 'collection_controller.dart';

class CollectionState extends Equatable {
  const CollectionState({required this.collection});

  final Collection collection;

  CollectionState copyWith({final Collection? collection}) {
    return CollectionState(collection: collection ?? this.collection);
  }

  @override
  List<Object?> get props => [collection];
}
