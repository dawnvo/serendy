import 'package:serendy/src/core/domain/assert.dart';
import 'package:serendy/src/core/domain/usecase.dart';
import 'package:serendy/src/core/exceptions/core_exception.dart';
import 'package:serendy/src/features/user/user.dart';

typedef EditProfilePayload = ({
  String executorId,
  String? name,
  String? avatar,
});

final class EditProfileUsecase implements UseCase<EditProfilePayload, User> {
  const EditProfileUsecase(
    this._userRepository,
  );

  final UserRepository _userRepository;

  @override
  Future<User> execute(EditProfilePayload payload) async {
    // 사용자를 찾을 수 없으면 예외 처리
    final user = CoreAssert.notEmpty<User>(
      await _userRepository.findOne(payload.executorId),
      const EntityNotFoundException(overrideMessage: "사용자를 찾을 수 없어요."),
    );

    // 권한이 없으면 예외 처리
    final hasAccess = payload.executorId == user.id;
    CoreAssert.isTrue(hasAccess, const AccessDeniedException());

    //TODO: 스토리지에 업로드를 진행합니다.
    String? downloadUrl;

    final edited = user.edit(
      name: payload.name,
      avatar: downloadUrl,
    );

    await _userRepository.update(edited);

    return edited;
  }
}
