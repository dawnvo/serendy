part of 'home_controller.dart';

enum HomeTab { latest, popular, finished }

extension HomeTabX on HomeTab {
  String get label => switch (this) {
        HomeTab.latest => '최신 애니',
        HomeTab.popular => '실시간 인기',
        HomeTab.finished => '완결 애니',
      };
}

final class HomeState extends Equatable {
  const HomeState({
    this.tab = HomeTab.popular,
    this.page = 0,
    this.medias = const [],
  });

  final HomeTab tab;
  final int page;
  final List<Media?> medias;

  HomeState copyWith({
    final HomeTab? tab,
    final int? page,
    final List<Media?>? medias,
  }) {
    return HomeState(
      tab: tab ?? this.tab,
      page: page ?? this.page,
      medias: medias ?? this.medias,
    );
  }

  @override
  List<Object?> get props => [
        tab,
        page,
        medias,
      ];
}
