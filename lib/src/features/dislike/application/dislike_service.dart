import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/dislike/dislike.dart';
import 'package:serendy/src/features/media/media.dart';

part 'dislike_service.g.dart';

/// 관심없는 목록에 추가해요.
@riverpod
Future<Dislike?> addDislike(
  AddDislikeRef ref, {
  required MediaID mediaId,
}) {
  final userId = ref.watch(requireUserIdProvider);
  return ref.read(addDislikeUsecaseProvider).execute((
    executorId: userId,
    mediaId: mediaId,
  ));
}

/// 관심없는 목록을 초기화해요.
@riverpod
Future<void> clearDislikes(
  ClearDislikesRef ref,
) {
  final userId = ref.watch(requireUserIdProvider);
  return ref.read(clearDislikesUsecaseProvider).execute((
    executorId: userId, //
  ));
}
