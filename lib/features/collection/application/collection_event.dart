part of 'collection_bloc.dart';

sealed class CollectionEvent extends Equatable {
  const CollectionEvent();
}

/// GET COLLECTION
final class CollectionFetched extends CollectionEvent {
  const CollectionFetched();

  @override
  List<Object> get props => [];
}

/// GET COLLECTIONS
final class CollectionsListFetched extends CollectionEvent {
  const CollectionsListFetched();

  @override
  List<Object> get props => [];
}

/// CREATE COLLECTION
final class CollectionCreated extends CollectionEvent {
  const CollectionCreated();

  @override
  List<Object> get props => [];
}

/// EDIT COLLECTION
final class CollectionEdited extends CollectionEvent {
  const CollectionEdited();

  @override
  List<Object> get props => [];
}

/// REMOVE COLLECTION
final class CollectionRemoved extends CollectionEvent {
  const CollectionRemoved();

  @override
  List<Object> get props => [];
}

/// ADD COLLECTION ITEM
final class CollectionItemAdded extends CollectionEvent {
  const CollectionItemAdded();

  @override
  List<Object> get props => [];
}

/// DELTE COLLECTION ITEM
final class CollectionItemDeleted extends CollectionEvent {
  const CollectionItemDeleted();

  @override
  List<Object> get props => [];
}
