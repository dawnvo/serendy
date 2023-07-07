part of 'theme_controller.dart';

class ThemeState extends Equatable {
  const ThemeState({
    required this.theme,
    required this.owner,
  });

  final Theme theme;
  final User owner;

  ThemeState copyWith({
    final Theme? theme,
    final User? owner,
    final bool? isOwner,
  }) {
    return ThemeState(
      theme: theme ?? this.theme,
      owner: owner ?? this.owner,
    );
  }

  @override
  List<Object?> get props => [
        theme,
        owner,
      ];
}
