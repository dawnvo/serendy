part of 'theme_controller.dart';

class ThemeState extends Equatable {
  const ThemeState({
    required this.theme,
    required this.owner,
    required this.isOwner,
  });

  final Theme theme;
  final User owner;
  final bool isOwner;

  ThemeState copyWith({
    final Theme? theme,
    final User? owner,
    final bool? isOwner,
  }) {
    return ThemeState(
      theme: theme ?? this.theme,
      owner: owner ?? this.owner,
      isOwner: isOwner ?? this.isOwner,
    );
  }

  @override
  List<Object?> get props => [
        theme,
        owner,
        isOwner,
      ];
}
