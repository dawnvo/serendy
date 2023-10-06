import 'package:serendy/src/core/domain/assert.dart';
import 'package:serendy/src/core/domain/usecase.dart';
import 'package:serendy/src/core/exceptions/core_exception.dart';
import 'package:serendy/src/features/profile/profile.dart';

typedef RemoveProfilePayload = ({
  UserID executorId,
  String? reason,
});

final class RemoveProfileUsecase implements UseCase<RemoveProfilePayload, void> {
  const RemoveProfileUsecase(this._profileRepository);
  final ProfileRepository _profileRepository;

  @override
  Future<void> execute(RemoveProfilePayload payload) async {
    // * 프로필이 존재하는지 확인해요.
    final profile = CoreAssert.notEmpty<Profile>(
      await _profileRepository.fetchProfile(id: payload.executorId),
      const EntityNotFoundException(overrideMessage: "사용자를 찾을 수 없어요."),
    );

    // * 올바른 실행자인지 확인해요.
    final hasAccess = payload.executorId == profile.id;
    CoreAssert.isTrue(hasAccess, const AccessDeniedException());

    // * 사용자를 제거해요.
    final removed = profile.remove();

    // * commit
    await _profileRepository.updateProfile(removed);
  }
}
