import 'package:serendy/core/domain/assert.dart';
import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/core/exceptions/core_exception.dart';
import 'package:serendy/features/user/user.dart';

typedef RemoveUserPort = ({
  String executorId,
  String? reason,
});

final class RemoveUserUsecase implements UseCase<RemoveUserPort, void> {
  const RemoveUserUsecase(this._userRepository);
  final UserRepository _userRepository;

  @override
  Future<void> execute(RemoveUserPort payload) async {
    // 사용자를 찾을 수 없으면 예외 처리
    final user = CoreAssert.notEmpty<User>(
      await _userRepository.findOne(payload.executorId),
      const EntityNotFoundException(overrideMessage: "사용자를 찾을 수 없어요."),
    );

    // 권한이 없으면 예외 처리
    final hasAccess = payload.executorId == user.id;
    CoreAssert.isTrue(hasAccess, const AccessDeniedException());

    final removed = user.remove();
    await _userRepository.update(removed);
  }
}
