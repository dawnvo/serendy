part of 'account_bloc.dart';

sealed class AccountEvent extends Equatable {
  const AccountEvent();
}

final class Account$Fetched extends AccountEvent {
  const Account$Fetched();

  @override
  List<Object> get props => [];
}
