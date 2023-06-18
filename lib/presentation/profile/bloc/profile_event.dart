part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();
}

/// 나의 컬렉션 목록을 불러와요.
final class Profile$MyCollectionsListFetched extends ProfileEvent {
  const Profile$MyCollectionsListFetched();

  @override
  List<Object> get props => [];
}

/// 컬렉션에 미디어를 추가해요.
final class Profile$CollectionItemAdded extends ProfileEvent {
  const Profile$CollectionItemAdded({
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
final class Profile$CollectionItemDeleted extends ProfileEvent {
  const Profile$CollectionItemDeleted({
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
