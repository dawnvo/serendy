import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/user/user.dart';

typedef CheckUsernamePayload = ({
  String username,
});

final class CheckUsernameUsecase implements UseCase<CheckUsernamePayload, bool> {
  const CheckUsernameUsecase(this._userRepository);
  final UserRepository _userRepository;

  @override
  Future<bool> execute(CheckUsernamePayload payload) async {
    // * 사용자가 존재하는지 확인해요.
    final user = await _userRepository.fetchUser(username: payload.username);
    // * 존재하면 True.
    return user != null;
  }
}
