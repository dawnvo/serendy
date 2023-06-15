part of 'collection_bloc.dart';

sealed class CollectionEvent extends Equatable {
  const CollectionEvent();
}

/// GET COLLECTION
final class CollectionFetched extends CollectionEvent {
  const CollectionFetched({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}

/// GET COLLECTIONS
final class CollectionsListFetched extends CollectionEvent {
  const CollectionsListFetched();

  @override
  List<Object> get props => [];
}

/// CREATE COLLECTION
final class CollectionCreated extends CollectionEvent {
  const CollectionCreated({required this.title});

  final String title;

  @override
  List<Object> get props => [title];
}

/// EDIT COLLECTION
final class CollectionEdited extends CollectionEvent {
  const CollectionEdited({
    required this.id,
    this.image,
    this.title,
    this.description,
    this.private,
  });

  final String id;
  final String? image;
  final String? title;
  final String? description;
  final bool? private;

  @override
  List<Object> get props => [id];
}

/// REMOVE COLLECTION
final class CollectionRemoved extends CollectionEvent {
  const CollectionRemoved({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}

/// ADD COLLECTION ITEM
final class CollectionItemAdded extends CollectionEvent {
  const CollectionItemAdded({
    required this.id,
    required this.mediaId,
  });

  final String id;
  final String mediaId;

  @override
  List<Object> get props => [id, mediaId];
}

/// DELTE COLLECTION ITEM
final class CollectionItemDeleted extends CollectionEvent {
  const CollectionItemDeleted({
    required this.id,
    required this.mediaId,
  });

  final String id;
  final String mediaId;

  @override
  List<Object> get props => [id, mediaId];
}
