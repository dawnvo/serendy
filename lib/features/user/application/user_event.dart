part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();
}

/// GET USER
final class UserFetched extends UserEvent {
  const UserFetched();

  @override
  List<Object> get props => [];
}

/// CREATE USER
final class UserCreated extends UserEvent {
  const UserCreated();

  @override
  List<Object> get props => [];
}

/// REMOVE USER
final class UserRemoved extends UserEvent {
  const UserRemoved();

  @override
  List<Object> get props => [];
}

/// EDIT USER PROFILE
final class UserProfileEdited extends UserEvent {
  const UserProfileEdited();

  @override
  List<Object> get props => [];
}
