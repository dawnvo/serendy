part of 'my_collections_bloc.dart';

sealed class MyCollectionsEvent extends Equatable {
  const MyCollectionsEvent();
}

/// 나의 컬렉션 목록을 불러와요.
final class MyCollections$Fetched extends MyCollectionsEvent {
  const MyCollections$Fetched();

  @override
  List<Object> get props => [];
}

/// 컬렉션에 미디어를 추가해요.
final class MyCollections$ItemAdded extends MyCollectionsEvent {
  const MyCollections$ItemAdded({
    required this.collectionId,
    required this.mediaId,
  });

  final String collectionId;
  final String mediaId;

  @override
  List<Object> get props => [
        collectionId,
        mediaId,
      ];
}

/// 컬렉션에서 미디어를 삭제해요.
final class MyCollections$ItemDeleted extends MyCollectionsEvent {
  const MyCollections$ItemDeleted({
    required this.collectionId,
    required this.mediaId,
  });

  final String collectionId;
  final String mediaId;

  @override
  List<Object> get props => [
        collectionId,
        mediaId,
      ];
}
