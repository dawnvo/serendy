part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
}

/// INITIAL
final class ProfileInitial extends ProfileState {
  const ProfileInitial();

  @override
  List<Object?> get props => [];
}

/// LOADING
final class ProfileLoading extends ProfileState {
  const ProfileLoading();

  @override
  List<Object?> get props => [];
}

/// LOADED
final class ProfileLoaded extends ProfileState {
  const ProfileLoaded({required this.collections});
  final List<Collection?> collections;

  @override
  List<Object?> get props => [collections];
}

/// ERROR
final class ProfileError extends ProfileState {
  const ProfileError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
