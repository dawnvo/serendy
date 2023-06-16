part of 'collection_bloc.dart';

sealed class CollectionState extends Equatable {
  const CollectionState();
}

/// LOADING
final class CollectionLoading extends CollectionState {
  const CollectionLoading();

  @override
  List<Object?> get props => [];
}

/// LOADED
final class CollectionLoaded extends CollectionState {
  const CollectionLoaded({required this.collection});
  final Collection collection;

  @override
  List<Object?> get props => [collection];
}

/// ERROR
final class CollectionError extends CollectionState {
  const CollectionError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
