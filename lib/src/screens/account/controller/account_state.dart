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
      // 편법으로 null 상태를 저장해요.
      errorMessage: errorMessage == '' //
          ? null
          : errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        email,
        username,
        errorMessage,
      ];
}
