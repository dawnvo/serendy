part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

final class Home$MediasListFetched extends HomeEvent {
  const Home$MediasListFetched();

  @override
  List<Object> get props => [];
}
