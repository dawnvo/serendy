import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/dislike/dislike.dart';
import 'package:serendy/src/features/profile/profile.dart';

final class DislikeRepositoryImpl extends DislikeRepository {
  const DislikeRepositoryImpl(this.supabase);
  final SupabaseClient supabase;

  static const String _tableDislikes = TablePath.dislikes;

  /**
   * 관심없는 목록에 추가해요.
   */
  @override
  Future<void> addDislike(
    Dislike dislike,
  ) {
    final entity = DislikeEntity(
      userId: dislike.userId,
      mediaId: dislike.mediaId,
      addedAt: dislike.addedAt,
    ).toJson();
    return supabase //
        .from(_tableDislikes)
        .insert(entity);
  }

  /**
   * 관심없는 목록을 초기화해요.
   */
  @override
  Future<void> clearDislikes(
    UserID userId,
  ) {
    return supabase //
        .from(_tableDislikes)
        .delete()
        .eq('user_id', userId);
  }
}
