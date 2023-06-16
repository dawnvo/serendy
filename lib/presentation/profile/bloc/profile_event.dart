part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();
}

final class ProfileMyCollectionsListFetched extends ProfileEvent {
  const ProfileMyCollectionsListFetched();

  @override
  List<Object> get props => [];
}
