part of 'library_controller.dart';

final class LibraryState extends Equatable {
  const LibraryState({
    this.evaluationsCount = 0,
    this.themes = const [],
  });

  final int evaluationsCount;
  final List<Theme?> themes;

  LibraryState copyWith({
    final int? evaluationsCount,
    final List<Theme?>? themes,
  }) {
    return LibraryState(
      evaluationsCount: evaluationsCount ?? this.evaluationsCount,
      themes: themes ?? this.themes,
    );
  }

  @override
  List<Object?> get props => [
        evaluationsCount,
        themes,
      ];
}
