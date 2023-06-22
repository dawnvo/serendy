import 'package:serendy/core/domain/assert.dart';
import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/core/exceptions/core_exception.dart';
import 'package:serendy/core/persistence/media_file_storage.dart';
import 'package:serendy/features/user/user.dart';

typedef EditProfilePort = ({
  String executorId,
  String? name,
  String? avatar,
});

final class EditProfileUsecase implements UseCase<EditProfilePort, User> {
  const EditProfileUsecase(
    this._userRepository,
    this._mediaFileStorage,
  );

  final UserRepository _userRepository;
  final MediaFileStorage _mediaFileStorage;

  @override
  Future<User> execute(EditProfilePort payload) async {
    // 사용자를 찾을 수 없으면 예외 처리
    final user = CoreAssert.notEmpty<User>(
      await _userRepository.findOne(payload.executorId),
      const EntityNotFoundException(overrideMessage: "사용자를 찾을 수 없어요."),
    );

    // 권한이 없으면 예외 처리
    final hasAccess = payload.executorId == user.id;
    CoreAssert.isTrue(hasAccess, const AccessDeniedException());

    // 이미지가 있고, 이전과 다른 이미지라면 스토리지에 업로드를 진행합니다.
    String? downloadUrl;
    if (payload.avatar != null &&
        payload.avatar != '' &&
        payload.avatar != user.avatar) {
      downloadUrl = await _mediaFileStorage.upload(user.id, payload.avatar!);
    }

    final edited = user.edit(
      name: payload.name,
      avatar: downloadUrl,
    );

    await _userRepository.update(edited);

    return edited;
  }
}
