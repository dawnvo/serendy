part of 'home_controller.dart';

class HomeState extends Equatable {
  const HomeState({required this.medias});

  final List<Media?> medias;

  @override
  List<Object?> get props => [medias];
}
