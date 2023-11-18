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
    log(name: 'Repository', 'searchMedias');
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
    log(name: 'Repository', 'fetchMedias');
    final medias = _mediaStore.value;
    return medias;
  }

  @override
  Future<Media?> fetchMediaSlice({
    required MediaID id,
  }) async {
    log(name: 'Repository', 'fetchMediaSlice');
    final medias = _mediaStore.value;
    return medias //
        .where((_) => _.id == id)
        .firstOrNull;
  }

  @override
  Future<Media?> fetchMedia({
    required MediaID id,
  }) async {
    log(name: 'Repository', 'fetchMedia');
    final medias = _mediaStore.value;
    return medias //
        .where((_) => _.id == id)
        .firstOrNull;
  }

  @override
  Future<List<MediaReaction?>> fetchReactions({
    required MediaID id,
  }) async {
    log(name: 'Repository', 'fetchReactions');
    final mediaReactions = _mediaReactionStore.value;
    return mediaReactions;
  }

  @override
  Future<void> incrementHits(
    Media media,
  ) async {
    log(name: 'Repository', 'incrementHits');
  }
}

final List<Media> mockMedias = [
  Media(
    type: MediaType.tv,
    status: MediaStatus.finished,
    title: "강철의 연금술사 BROTHERHOOD",
    image: "https://cdn.myanimelist.net/images/anime/1208/94745.webp",
    thumbnail: "https://cdn.myanimelist.net/images/anime/1208/94745.webp",
    keywords: const ["코미디", "액션", "능력"],
    trailer: 'gKWEUJ4r5do',
  ),
  Media(
    type: MediaType.tv,
    status: MediaStatus.finished,
    title: "슈타인즈 게이트",
    image: "https://cdn.myanimelist.net/images/anime/1935/127974.webp",
    thumbnail: "https://cdn.myanimelist.net/images/anime/1935/127974.webp",
    keywords: const ["코미디", "액션", "능력"],
    trailer: 'gKWEUJ4r5do',
    overview: "우연히 주운 한 권의 『공병문고』로 우리는 조금씩 가까워지기 시작했다.",
  ),
  Media(
    type: MediaType.tv,
    status: MediaStatus.finished,
    title: "진격의 거인",
    image: "https://cdn.myanimelist.net/images/anime/10/47347.webp",
    thumbnail: "https://cdn.myanimelist.net/images/anime/10/47347.webp",
    keywords: const ["코미디", "액션", "능력"],
    overview: "우연히 주운 한 권의 『공병문고』로 우리는 조금씩 가까워지기 시작했다.",
  ),
  Media(
    type: MediaType.tv,
    status: MediaStatus.finished,
    title: "주술회전",
    image: "https://cdn.myanimelist.net/images/anime/1171/109222.webp",
    thumbnail: "https://cdn.myanimelist.net/images/anime/1171/109222.webp",
    keywords: const ["코미디", "액션", "능력"],
  ),
];

final List<MediaReaction> mockMediaReactions = [
  const MediaReaction(emotion: Emotion.surprise, count: 77),
  const MediaReaction(emotion: Emotion.happyness, count: 324),
  const MediaReaction(emotion: Emotion.nice, count: 80),
];
