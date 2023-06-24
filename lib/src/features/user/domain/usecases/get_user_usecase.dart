import 'package:serendy/src/core/domain/assert.dart';
import 'package:serendy/src/core/domain/usecase.dart';
import 'package:serendy/src/core/exceptions/core_exception.dart';
import 'package:serendy/src/features/user/user.dart';

typedef GetUserPayload = ({
  String userId,
});

final class GetUserUsecase implements UseCase<GetUserPayload, User> {
  const GetUserUsecase(this._userRepository);
  final UserRepository _userRepository;

  @override
  Future<User> execute(GetUserPayload payload) async {
    // 사용자를 찾을 수 없으면 예외 처리
    final user = CoreAssert.notEmpty<User>(
      await _userRepository.findOne(payload.userId),
      const EntityNotFoundException(overrideMessage: "사용자를 찾을 수 없어요."),
    );

    return user;
  }
}
