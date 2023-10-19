import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/dislike/dislike.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';

typedef AddDislikePayload = ({
  UserID executorId,
  MediaID mediaId,
});

final class AddDislikeUsecase implements UseCase<AddDislikePayload, Dislike> {
  const AddDislikeUsecase(
    this._dislikeRepository,
    this._userRepository,
    this._mediaRepository,
  );

  final DislikeRepository _dislikeRepository;
  final UserRepository _userRepository;
  final MediaRepository _mediaRepository;

  @override
  Future<Dislike> execute(AddDislikePayload payload) async {
    // * 사용자가 존재하는지 확인해요.
    final user = CoreAssert.notEmpty<User>(
      await _userRepository.fetchUser(id: payload.executorId),
      const EntityNotFoundException(overrideMessage: "사용자를 찾을 수 없어요."),
    );

    // * 작품이 존재하는지 확인해요.
    final media = CoreAssert.notEmpty<Media>(
      await _mediaRepository.fetchMediaSlice(id: payload.mediaId),
      const EntityNotFoundException(overrideMessage: "작품을 찾을 수 없어요."),
    );

    // * 평가 인스턴스를 생성해요.
    final dislike = Dislike(
      userId: user.id,
      mediaId: media.id,
    );

    // * commit
    await _dislikeRepository.addDislike(dislike);
    return dislike;
  }
}
