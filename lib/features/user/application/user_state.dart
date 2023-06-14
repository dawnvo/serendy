part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();
}

/// LOADING
final class UserLoading extends UserState {
  const UserLoading();

  @override
  List<Object?> get props => [];
}

/// LOADED USER
final class UserLoaded extends UserState {
  const UserLoaded({required this.user});
  final User user;

  @override
  List<Object?> get props => [user];
}

/// ERROR
final class UserError extends UserState {
  const UserError({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
