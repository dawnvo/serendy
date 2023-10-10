part of 'edit_theme_controller.dart';

enum EditThemeStatus {
  initial,
  loading,
  success,
  failure,
}

final class EditThemeState extends Equatable {
  const EditThemeState({
    this.status = EditThemeStatus.initial,
    required this.initialTheme,
    required this.private,
    required this.title,
    this.editedTheme,
    this.image,
    this.description,
    this.errorMessage,
  });

  final EditThemeStatus status;
  final Theme initialTheme;
  final Theme? editedTheme;
  final String title;
  final String? image;
  final bool private;
  final String? description;
  final String? errorMessage;

  bool get isEdited =>
      initialTheme.image != image ||
      initialTheme.title != title ||
      initialTheme.description != description ||
      initialTheme.private != private;

  EditThemeState copyWith({
    final EditThemeStatus? status,
    final Theme? initialTheme,
    final Theme? editedTheme,
    final String? title,
    final String? image,
    final bool? private,
    final String? description,
    final String? errorMessage,
  }) {
    return EditThemeState(
      status: status ?? this.status,
      initialTheme: initialTheme ?? this.initialTheme,
      editedTheme: editedTheme ?? this.editedTheme,
      title: title ?? this.title,
      image: image ?? this.image,
      private: private ?? this.private,
      description: description ?? this.description,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        title,
        image,
        private,
        description,
        errorMessage,
      ];
}
