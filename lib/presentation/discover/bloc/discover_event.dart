part of 'discover_bloc.dart';

sealed class DiscoverEvent extends Equatable {
  const DiscoverEvent();
}

/// 추천 컬렉션 목록을 불러와요.
final class Discover$CollectionsListFetched extends DiscoverEvent {
  const Discover$CollectionsListFetched();

  @override
  List<Object> get props => [];
}
