import 'package:serendy/src/core/domain/assert.dart';
import 'package:serendy/src/core/domain/usecase.dart';
import 'package:serendy/src/core/exceptions/core_exception.dart';
import 'package:serendy/src/features/profile/profile.dart';

typedef EditProfilePayload = ({
  UserID executorId,
  String? name,
  String? avatar,
});

final class EditProfileUsecase implements UseCase<EditProfilePayload, Profile> {
  const EditProfileUsecase(
    this._profileRepository,
  );

  final ProfileRepository _profileRepository;

  @override
  Future<Profile> execute(EditProfilePayload payload) async {
    // * 프로필이 존재하는지 확인해요.
    final profile = CoreAssert.notEmpty<Profile>(
      await _profileRepository.fetchProfile(id: payload.executorId),
      const EntityNotFoundException(overrideMessage: "사용자를 찾을 수 없어요."),
    );

    // * 올바른 실행자인지 확인해요.
    final hasAccess = payload.executorId == profile.id;
    CoreAssert.isTrue(hasAccess, const AccessDeniedException());

    // TODO: 사진을 업로드해요.
    String? downloadUrl;

    // * 사용자 정보를 수정해요.
    final edited = profile.edit(
      name: payload.name,
      avatar: downloadUrl,
    );

    // * commit
    await _profileRepository.updateProfile(edited);
    return edited;
  }
}
