import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/features/user/data/user_repository.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc({required this.userRepository}) : super(const AccountState()) {
    on<Account$Fetched>(_onFetched);
  }

  final UserRepository userRepository;

  Future<void> _onFetched(
    Account$Fetched event,
    Emitter<AccountState> emit,
  ) async {
    emit(state.copyWith(status: AccountStatus.loading));

    try {
      final me = await userRepository.fetchMe();

      if (me == null) {
        emit(state.copyWith(
          status: AccountStatus.failure,
          errorMessage: "사용자를 찾을 수 없어요.",
        ));
      }

      emit(state.copyWith(
        status: AccountStatus.success,
        username: me!.name,
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
