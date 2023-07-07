part of 'edit_theme_controller.dart';

enum EditThemeStatus { initial, loading, success, failure }

final class EditThemeState extends Equatable {
  const EditThemeState({
    this.status = EditThemeStatus.initial,
    required this.initialTheme,
    required this.private,
    required this.title,
    this.image,
    this.description,
    this.errorMessage,
  });

  final EditThemeStatus status;
  final Theme initialTheme;
  final String? image;
  final String title;
  final String? description;
  final bool private;
  final String? errorMessage;

  bool get isEdited =>
      initialTheme.image != image ||
      initialTheme.title != title ||
      initialTheme.description != description ||
      initialTheme.private != private;

  EditThemeState copyWith({
    final EditThemeStatus? status,
    final Theme? initialTheme,
    final String? image,
    final String? title,
    final String? description,
    final bool? private,
    final String? errorMessage,
  }) {
    return EditThemeState(
      status: status ?? this.status,
      initialTheme: initialTheme ?? this.initialTheme,
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
      private: private ?? this.private,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        image,
        title,
        description,
        private,
        errorMessage,
      ];
}
