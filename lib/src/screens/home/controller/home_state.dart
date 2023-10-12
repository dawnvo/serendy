part of 'home_controller.dart';

class HomeState extends Equatable {
  const HomeState({
    this.page = 0,
    this.medias = const [],
  });

  final int page;
  final List<Media?> medias;

  HomeState copyWith({
    final int? page,
    final List<Media?>? medias,
  }) {
    return HomeState(
      page: page ?? this.page,
      medias: medias ?? this.medias,
    );
  }

  @override
  List<Object?> get props => [
        page,
        medias,
      ];
}
