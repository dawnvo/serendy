part of 'discover_bloc.dart';

sealed class DiscoverState extends Equatable {
  const DiscoverState();
}

/// LOADING
final class DiscoverLoading extends DiscoverState {
  const DiscoverLoading();

  @override
  List<Object?> get props => [];
}

/// LOADED DISCOVER
final class DiscoverLoaded extends DiscoverState {
  const DiscoverLoaded({required this.collections});
  final List<Collection?> collections;

  @override
  List<Object?> get props => [collections];
}

/// ERROR
final class DiscoverError extends DiscoverState {
  const DiscoverError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
