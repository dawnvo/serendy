part of 'sign_in_controller.dart';

enum SignInStatus { initial, loading, success, failure }

final class SignInState extends Equatable {
  const SignInState({
    this.status = SignInStatus.initial,
    this.errorMessage,
  });

  final SignInStatus status;
  final String? errorMessage;

  SignInState copyWith({
    final SignInStatus? status,
    final String? errorMessage,
  }) {
    return SignInState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
      ];
}
