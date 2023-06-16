part of 'discover_bloc.dart';

sealed class DiscoverEvent extends Equatable {
  const DiscoverEvent();
}

final class DiscoverCollectionsListFetched extends DiscoverEvent {
  const DiscoverCollectionsListFetched();

  @override
  List<Object> get props => [];
}
