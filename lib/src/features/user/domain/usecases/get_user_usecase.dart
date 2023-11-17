import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/user/user.dart';

typedef GetUserPayload = ({
  UserID userId,
});

final class GetUserUsecase implements UseCase<GetUserPayload, User?> {
  const GetUserUsecase(this._userRepository);
  final UserRepository _userRepository;

  @override
  Future<User?> execute(GetUserPayload payload) async {
    // * 사용자가 존재하는지 확인해요.
    final user = await _userRepository.fetchUser(id: payload.userId);
    return user;
  }
}
