part of 'sign_up_controller.dart';

final class SignUpState extends Equatable {
  const SignUpState({
    this.username = '',
    this.errorText,
  });

  final String username;
  final String? errorText;

  SignUpState copyWith({
    final String? username,
    final String? errorText,
  }) {
    return SignUpState(
      username: username ?? this.username,
      // * null 값을 의도적으로 넘기기 위해 조건문을 사용해요.
      errorText: errorText != this.errorText //
          ? errorText
          : this.errorText,
    );
  }

  @override
  List<Object?> get props => [
        username,
        errorText,
      ];
}
