part of 'account_bloc.dart';

enum AccountStatus { initial, loading, success, failure }

final class AccountState extends Equatable {
  const AccountState({
    this.status = AccountStatus.initial,
    this.username = '',
    this.avatar,
    this.email,
    this.errorMessage,
  });

  final AccountStatus status;
  final String username;
  final String? avatar;
  final String? email;
  final String? errorMessage;

  AccountState copyWith({
    final AccountStatus? status,
    final String? username,
    final String? avatar,
    final String? email,
    final String? errorMessage,
  }) {
    return AccountState(
      status: status ?? this.status,
      username: username ?? this.username,
      avatar: avatar ?? this.avatar,
      email: email ?? this.email,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        username,
        avatar,
        email,
        errorMessage,
      ];
}
