part of 'collection_controller.dart';

class CollectionState extends Equatable {
  const CollectionState({
    required this.collection,
    required this.owner,
    required this.isOwner,
  });

  final Collection collection;
  final User owner;
  final bool isOwner;

  CollectionState copyWith({
    final Collection? collection,
    final User? owner,
    final bool? isOwner,
  }) {
    return CollectionState(
      collection: collection ?? this.collection,
      owner: owner ?? this.owner,
      isOwner: isOwner ?? this.isOwner,
    );
  }

  @override
  List<Object?> get props => [
        collection,
        owner,
        isOwner,
      ];
}
