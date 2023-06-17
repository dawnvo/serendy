part of 'collection_bloc.dart';

sealed class CollectionEvent extends Equatable {
  const CollectionEvent();
}

/// 컬렉션을 불러와요.
final class Collection$Fetched extends CollectionEvent {
  const Collection$Fetched({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}
