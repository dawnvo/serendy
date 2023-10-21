part of 'account_controller.dart';

final class AccountState extends Equatable {
  const AccountState({
    required this.email,
    required this.username,
    this.errorText,
  });

  final String email;
  final String username;
  final String? errorText;

  AccountState copyWith({
    final String? email,
    final String? username,
    final String? errorText,
  }) {
    return AccountState(
      email: email ?? this.email,
      username: username ?? this.username,
      // * null 값을 의도적으로 넘기기 위해 조건문을 사용해요.
      errorText: errorText != this.errorText //
          ? errorText
          : this.errorText,
    );
  }

  @override
  List<Object?> get props => [
        email,
        username,
        errorText,
      ];
}
