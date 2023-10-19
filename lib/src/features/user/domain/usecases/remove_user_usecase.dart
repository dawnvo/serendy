import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/user/user.dart';

typedef RemoveUserPayload = ({
  UserID executorId,
  String? reason,
});

final class RemoveUserUsecase implements UseCase<RemoveUserPayload, void> {
  const RemoveUserUsecase(this._userRepository);
  final UserRepository _userRepository;

  @override
  Future<void> execute(RemoveUserPayload payload) async {
    // * 사용자가 존재하는지 확인해요.
    final user = CoreAssert.notEmpty<User>(
      await _userRepository.fetchUser(id: payload.executorId),
      const EntityNotFoundException(overrideMessage: "사용자를 찾을 수 없어요."),
    );

    // * 올바른 실행자인지 확인해요.
    final hasAccess = payload.executorId == user.id;
    CoreAssert.isTrue(hasAccess, const AccessDeniedException());

    // * 사용자를 제거해요.
    final removed = user.remove();

    // * commit
    await _userRepository.updateUser(removed);
  }
}
