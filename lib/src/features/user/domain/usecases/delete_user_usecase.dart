import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/user/user.dart';

typedef DeleteUserPayload = ({
  UserID executorId,
  ExitReason reason,
  String? comment,
});

final class DeleteUserUsecase implements UseCase<DeleteUserPayload, void> {
  const DeleteUserUsecase(this._userRepository);
  final UserRepository _userRepository;

  @override
  Future<void> execute(DeleteUserPayload payload) async {
    // * 사용자가 존재하는지 확인해요.
    final user = CoreAssert.notEmpty<User>(
      await _userRepository.fetchUser(id: payload.executorId),
      const EntityNotFoundException(overrideMessage: "사용자를 찾을 수 없어요."),
    );

    // * 올바른 실행자인지 확인해요.
    final hasAccess = payload.executorId == user.id;
    CoreAssert.isTrue(hasAccess, const AccessDeniedException());

    // * commit
    await _userRepository.deleteUser(
      userId: user.id,
      reason: payload.reason,
      comment: payload.comment,
    );
  }
}
