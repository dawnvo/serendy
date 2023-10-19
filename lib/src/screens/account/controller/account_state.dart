part of 'account_controller.dart';

final class AccountState extends Equatable {
  const AccountState({
    required this.email,
    required this.username,
    this.errorMessage,
  });

  final String email;
  final String username;
  final String? errorMessage;

  AccountState copyWith({
    final String? email,
    final String? username,
    final String? errorMessage,
  }) {
    return AccountState(
      email: email ?? this.email,
      username: username ?? this.username,
      // * null 값을 의도적으로 넘기기 위해 조건문을 사용해요.
      errorMessage: errorMessage != this.errorMessage //
          ? errorMessage
          : this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        email,
        username,
        errorMessage,
      ];
}
