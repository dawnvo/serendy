import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/features/user/data/user_repository.dart';
import 'package:serendy/features/user/domain/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required this.userRepository}) : super(const UserLoading()) {
    on<UserFetched>(_onFetched);
    on<UserCreated>(_onCreated);
    on<UserRemoved>(_onRemoved);
    on<UserProfileEdited>(_onProfileEdited);
  }

  final UserRepository userRepository;

  Future<void> _onFetched(
    UserFetched event,
    Emitter<UserState> emit,
  ) async {}

  Future<void> _onCreated(
    UserCreated event,
    Emitter<UserState> emit,
  ) async {}

  Future<void> _onRemoved(
    UserRemoved event,
    Emitter<UserState> emit,
  ) async {}

  Future<void> _onProfileEdited(
    UserProfileEdited event,
    Emitter<UserState> emit,
  ) async {}
}
