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
