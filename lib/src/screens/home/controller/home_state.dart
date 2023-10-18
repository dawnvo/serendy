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
    this.medias = const [],
    this.page = 0,
    this.isCompleted = false,
  });

  final HomeTab tab;
  final List<Media?> medias;
  final int page;
  final bool isCompleted;

  HomeState copyWith({
    final HomeTab? tab,
    final List<Media?>? medias,
    final int? page,
    final bool? isCompleted,
  }) {
    return HomeState(
      tab: tab ?? this.tab,
      medias: medias ?? this.medias,
      page: page ?? this.page,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [
        tab,
        medias,
        page,
      ];
}
