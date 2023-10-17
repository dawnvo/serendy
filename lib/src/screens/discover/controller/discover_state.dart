part of 'discover_controller.dart';

final class DiscoverState extends Equatable {
  const DiscoverState({
    this.page = 0,
    this.themes = const [],
  });

  final int page;
  final List<Theme?> themes;

  DiscoverState copyWith({
    final int? page,
    final List<Theme?>? themes,
  }) {
    return DiscoverState(
      page: page ?? this.page,
      themes: themes ?? this.themes,
    );
  }

  @override
  List<Object?> get props => [
        page,
        themes,
      ];
}
