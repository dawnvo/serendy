import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/media/media.dart';

part 'media_service.g.dart';

/// 미디어를 검색해요.
@riverpod
Future<List<Media?>> searchMedia(
  SearchMediaRef ref, {
  String? title,
}) {
  return MediaModule.searchMediaUsecase.execute((title: title));
}

/// 미디어 정보를 불러와요.
@riverpod
Future<Media> fetchMedia(
  FetchMediaRef ref, {
  required String mediaId,
}) {
  return MediaModule.getMediaUsecase.execute((mediaId: mediaId));
}

/// 미디어를 추가해요.
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
