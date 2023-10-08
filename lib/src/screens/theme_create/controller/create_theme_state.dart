part of 'create_theme_controller.dart';

enum CreateThemeStatus { initial, loading, success, failure }

class CreateThemeState extends Equatable {
  const CreateThemeState({
    this.status = CreateThemeStatus.initial,
    this.title = '',
    this.hintText = '나의 테마',
    this.errorMessage,
  });

  final CreateThemeStatus status;
  final String title;
  final String hintText;
  final String? errorMessage;

  CreateThemeState copyWith({
    final CreateThemeStatus? status,
    final String? title,
    final String? hintText,
    final String? errorMessage,
  }) {
    return CreateThemeState(
      status: status ?? this.status,
      title: title ?? this.title,
      hintText: hintText ?? this.hintText,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        title,
        hintText,
        errorMessage,
      ];
}
