import 'package:serendy/src/core/domain/assert.dart';
import 'package:serendy/src/core/domain/usecase.dart';
import 'package:serendy/src/core/exceptions/core_exception.dart';
import 'package:serendy/src/features/profile/profile.dart';

typedef GetProfilePayload = ({
  UserID userId,
});

final class GetProfileUsecase implements UseCase<GetProfilePayload, Profile> {
  const GetProfileUsecase(this._profileRepository);
  final ProfileRepository _profileRepository;

  @override
  Future<Profile> execute(GetProfilePayload payload) async {
    // * 프로필이 존재하는지 확인해요.
    final profile = CoreAssert.notEmpty<Profile>(
      await _profileRepository.fetchProfile(id: payload.userId),
      const EntityNotFoundException(overrideMessage: "사용자를 찾을 수 없어요."),
    );

    return profile;
  }
}
