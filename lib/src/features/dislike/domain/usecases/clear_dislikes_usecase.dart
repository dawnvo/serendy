import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/dislike/dislike.dart';
import 'package:serendy/src/features/profile/profile.dart';

typedef ClearDislikesPayload = ({
  UserID executorId,
});

final class ClearDislikesUsecase implements UseCase<ClearDislikesPayload, void> {
  const ClearDislikesUsecase(
    this._dislikeRepository,
  );

  final DislikeRepository _dislikeRepository;

  @override
  Future<void> execute(ClearDislikesPayload payload) async {
    // * commit
    await _dislikeRepository.clearDislikes(payload.executorId);
  }
}
