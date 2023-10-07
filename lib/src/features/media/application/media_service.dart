import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/media/media.dart';

part 'media_service.g.dart';

/// 작품을 검색해요.
@riverpod
Future<List<Media?>> searchMedias(
  SearchMediasRef ref, {
  required String title,
}) {
  return MediaModule.searchMediasUsecase.execute((title: title));
}

/// 작품 목록을 불러와요.
@riverpod
Future<List<Media?>> getMedias(
  GetMediasRef ref,
) {
  return MediaModule.getMediasUsecase.execute(());
}

/// 작품 정보를 불러와요.
@riverpod
Future<Media> getMedia(
  GetMediaRef ref, {
  required MediaID id,
}) {
  return MediaModule.getMediaUsecase.execute((mediaId: id));
}

/// 작품을 추가해요.
@riverpod
Future<void> addMedia(
  AddMediaRef ref, {
  required MediaStatus status,
  required MediaType type,
  required String title,
  required String image,
  required List<String> keywords,
  String? synopsis,
  DateTime? endDate,
  bool? isAdult,
  DateTime? startDate,
}) {
  final userId = ref.watch(requireUserIdProvider);
  return MediaModule.addMediaUsecase.execute((
    executorId: userId,
    image: image,
    keywords: keywords,
    status: status,
    synopsis: synopsis,
    title: title,
    type: type,
    endDate: endDate,
    isAdult: isAdult,
    startDate: startDate,
  ));
}
