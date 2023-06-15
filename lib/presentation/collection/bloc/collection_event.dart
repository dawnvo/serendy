part of 'collection_bloc.dart';

sealed class CollectionEvent extends Equatable {
  const CollectionEvent();
}

final class CollectionFetched extends CollectionEvent {
  const CollectionFetched({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}
