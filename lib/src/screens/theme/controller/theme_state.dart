part of 'theme_controller.dart';

class ThemeState extends Equatable {
  const ThemeState({
    required this.theme,
    required this.owner,
  });

  final Theme theme;
  final Profile owner;

  ThemeState copyWith({
    final Theme? theme,
    final Profile? owner,
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
