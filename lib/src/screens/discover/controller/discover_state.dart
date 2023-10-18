part of 'discover_controller.dart';

final class DiscoverState extends Equatable {
  const DiscoverState({
    this.themes = const [],
    this.page = 0,
    this.isCompleted = false,
  });

  final List<Theme?> themes;
  final int page;
  final bool isCompleted;

  DiscoverState copyWith({
    final List<Theme?>? themes,
    final int? page,
    final bool? isCompleted,
  }) {
    return DiscoverState(
      themes: themes ?? this.themes,
      page: page ?? this.page,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [
        themes,
        page,
      ];
}
