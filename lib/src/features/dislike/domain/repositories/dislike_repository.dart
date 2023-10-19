import 'package:serendy/src/features/dislike/dislike.dart';
import 'package:serendy/src/features/user/user.dart';

abstract class DislikeRepository {
  const DislikeRepository();

  /// 관심없는 목록에 추가해요.
  Future<void> addDislike(
    Dislike dislike,
  );

  /// 관심없는 목록을 초기화해요.
  Future<void> clearDislikes(
    UserID userId,
  );
}
