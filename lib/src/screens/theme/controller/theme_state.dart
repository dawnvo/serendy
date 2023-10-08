part of 'theme_controller.dart';

class ThemeState extends Equatable {
  const ThemeState({required this.theme});
  final Theme theme;

  ThemeState copyWith({final Theme? theme}) {
    return ThemeState(theme: theme ?? this.theme);
  }

  @override
  List<Object?> get props => [theme];
}
