part of 'discover_controller.dart';

class DiscoverState extends Equatable {
  const DiscoverState({required this.themes});

  final List<Theme?> themes;

  @override
  List<Object?> get props => [themes];
}
