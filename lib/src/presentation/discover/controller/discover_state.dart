part of 'discover_controller.dart';

class DiscoverState extends Equatable {
  const DiscoverState({required this.collections});

  final List<Collection?> collections;

  @override
  List<Object?> get props => [collections];
}
