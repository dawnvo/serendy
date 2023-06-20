import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/features/user/user.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc({required this.userService}) : super(const AccountState()) {
    on<Account$Fetched>(_onFetched);
  }

  final UserService userService;

  Future<void> _onFetched(
    Account$Fetched event,
    Emitter<AccountState> emit,
  ) async {
    emit(state.copyWith(status: AccountStatus.loading));

    try {
      final me = await userService.fetchMe();

      emit(state.copyWith(
        status: AccountStatus.success,
        username: me.name,
        avatar: me.avatar,
        email: me.email,
      ));
    } catch (err) {
      emit(state.copyWith(
        status: AccountStatus.failure,
        errorMessage: err.toString(),
      ));
    }
  }
}
