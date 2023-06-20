import 'package:serendy/core/domain/assert.dart';
import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/core/exceptions/core_exception.dart';
import 'package:serendy/features/user/domain/ports/persistence/user_repository_port.dart';
import 'package:serendy/features/user/domain/ports/usecases/get_user_port.dart';
import 'package:serendy/features/user/user.dart';

final class GetUserUsecase implements UseCase<GetUserPort, User> {
  const GetUserUsecase(this._userRepository);

  final UserRepositoryPort _userRepository;

  @override
  Future<User> execute(GetUserPort payload) async {
    // 사용자를 찾을 수 없으면 예외 처리
    final user = CoreAssert.notEmpty<User>(
      await _userRepository.findOne(payload.userId),
      const EntityNotFoundException(overrideMessage: "사용자를 찾을 수 없어요."),
    );

    return user;
  }
}
