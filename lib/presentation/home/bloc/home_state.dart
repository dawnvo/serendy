part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

/// INITIAL
final class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  List<Object?> get props => [];
}

/// LOADING
final class HomeLoading extends HomeState {
  const HomeLoading();

  @override
  List<Object?> get props => [];
}

/// LOADED
final class HomeLoaded extends HomeState {
  const HomeLoaded({required this.medias});
  final List<Media?> medias;

  @override
  List<Object?> get props => [medias];
}

/// ERROR
final class HomeError extends HomeState {
  const HomeError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
