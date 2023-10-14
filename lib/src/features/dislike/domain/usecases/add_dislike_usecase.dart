import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/dislike/dislike.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/profile/profile.dart';

typedef AddDislikePayload = ({
  UserID executorId,
  MediaID mediaId,
});

final class AddDislikeUsecase implements UseCase<AddDislikePayload, Dislike> {
  const AddDislikeUsecase(
    this._dislikeRepository,
    this._profileRepository,
    this._mediaRepository,
  );

  final DislikeRepository _dislikeRepository;
  final ProfileRepository _profileRepository;
  final MediaRepository _mediaRepository;

  @override
  Future<Dislike> execute(AddDislikePayload payload) async {
    // * 프로필이 존재하는지 확인해요.
    final profile = CoreAssert.notEmpty<Profile>(
      await _profileRepository.fetchProfile(id: payload.executorId),
      const EntityNotFoundException(overrideMessage: "사용자를 찾을 수 없어요."),
    );

    // * 작품이 존재하는지 확인해요.
    final media = CoreAssert.notEmpty<Media>(
      await _mediaRepository.fetchMediaSlice(id: payload.mediaId),
      const EntityNotFoundException(overrideMessage: "작품을 찾을 수 없어요."),
    );

    // * 평가 인스턴스를 생성해요.
    final dislike = Dislike(
      userId: profile.id,
      mediaId: media.id,
    );

    // * commit
    await _dislikeRepository.addDislike(dislike);
    return dislike;
  }
}
