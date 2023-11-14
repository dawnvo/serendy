import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/features/media/media.dart';

part 'media_service.g.dart';

/// 작품을 검색해요.
@riverpod
Future<List<Media?>> searchMedias(
  SearchMediasRef ref, {
  required String query,
  int? page,
}) {
  return ref.read(searchMediasUsecaseProvider).execute((
    query: query,
    page: page,
  ));
}

/// 작품 목록을 불러와요.
@riverpod
Future<List<Media?>> getMedias(
  GetMediasRef ref, {
  int? page,
}) {
  return ref.read(getMediasUsecaseProvider).execute((page: page));
}

/// 작품 정보를 불러와요.
@riverpod
Future<Media> getMedia(
  GetMediaRef ref, {
  required MediaID id,
}) {
  return ref.read(getMediaUsecaseProvider).execute((mediaId: id));
}

/// 작품 반응을 불러와요.
@riverpod
Future<List<MediaReaction?>> getMediaReactions(
  GetMediaReactionsRef ref, {
  required MediaID id,
}) {
  return ref.read(getMediaReactionsUsecaseProvider).execute((mediaId: id));
}
