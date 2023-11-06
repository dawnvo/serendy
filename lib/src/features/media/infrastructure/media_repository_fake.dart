import 'dart:developer';

import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/domain/entities/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';

final class MediaRepositoryFake implements MediaRepository {
  MediaRepositoryFake();

  final _mediaStore = InMemoryStore(mockMedias);
  final _mediaReactionStore = InMemoryStore(mockMediaReactions);

  @override
  Future<List<Media?>> searchMedias({
    required String query,
    int? page,
    int? perPage,
  }) async {
    log(name: 'MediaRepository', 'searchMedias');
    final medias = _mediaStore.value;
    return medias //
        .where((_) => _.title.contains(query))
        .toList();
  }

  @override
  Future<List<Media?>> fetchMedias({
    int? page,
    int? perPage,
  }) async {
    log(name: 'MediaRepository', 'fetchMedias');
    final medias = _mediaStore.value;
    return medias;
  }

  @override
  Future<Media?> fetchMediaSlice({
    required MediaID id,
  }) async {
    log(name: 'MediaRepository', 'fetchMediaSlice');
    final medias = _mediaStore.value;
    return medias //
        .where((_) => _.id == id)
        .firstOrNull;
  }

  @override
  Future<Media?> fetchMedia({
    required MediaID id,
  }) async {
    log(name: 'MediaRepository', 'fetchMedia');
    final medias = _mediaStore.value;
    return medias //
        .where((_) => _.id == id)
        .firstOrNull;
  }

  @override
  Future<List<MediaReaction?>> fetchReactions({
    required MediaID id,
  }) async {
    log(name: 'MediaRepository', 'fetchReactions');
    final mediaReactions = _mediaReactionStore.value;
    return mediaReactions;
  }

  @override
  Future<void> upsertMedia(
    Media media,
  ) async {
    log(name: 'MediaRepository', 'upsertMedia');
    final medias = _mediaStore.value;
    medias.add(media);
  }

  @override
  Future<void> incrementHits(
    Media media,
  ) async {
    log(name: 'MediaRepository', 'incrementHits');
  }
}

final List<Media> mockMedias = [
  Media(
    type: MediaType.anime,
    status: MediaStatus.finished,
    title: "강철의 연금술사 BROTHERHOOD",
    image: "https://cdn.myanimelist.net/images/anime/1208/94745.jpg",
    keywords: const ["코미디", "액션", "능력"],
    youtubeId: const ['gKWEUJ4r5do'],
  ),
  Media(
    type: MediaType.anime,
    status: MediaStatus.finished,
    title: "슈타인즈 게이트",
    image: "https://cdn.myanimelist.net/images/anime/1935/127974.jpg",
    keywords: const ["코미디", "액션", "능력"],
    youtubeId: const ['gKWEUJ4r5do'],
  ),
  Media(
    type: MediaType.anime,
    status: MediaStatus.finished,
    title: "진격의 거인",
    image: "https://cdn.myanimelist.net/images/anime/10/47347.jpg",
    keywords: const ["코미디", "액션", "능력"],
    youtubeId: const ['gKWEUJ4r5do'],
  ),
  Media(
    type: MediaType.anime,
    status: MediaStatus.finished,
    title: "주술회전",
    image: "https://cdn.myanimelist.net/images/anime/1171/109222.jpg",
    keywords: const ["코미디", "액션", "능력"],
    youtubeId: const ['gKWEUJ4r5do'],
  ),
];

final List<MediaReaction> mockMediaReactions = [
  const MediaReaction(emotion: Emotion.surprise, count: 77),
  const MediaReaction(emotion: Emotion.happyness, count: 324),
  const MediaReaction(emotion: Emotion.nice, count: 80),
];
