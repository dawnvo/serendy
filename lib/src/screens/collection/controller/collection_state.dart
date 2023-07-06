part of 'collection_controller.dart';

class CollectionState extends Equatable {
  const CollectionState({
    required this.collection,
    required this.owner,
  });

  final Collection collection;
  final User owner;

  CollectionState copyWith({
    final Collection? collection,
    final User? owner,
  }) {
    return CollectionState(
      collection: collection ?? this.collection,
      owner: owner ?? this.owner,
    );
  }

  @override
  List<Object?> get props => [
        collection,
        owner,
      ];
}
