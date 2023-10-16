import 'package:serendy/src/features/media/media.dart';

abstract class MediaRepository {
  const MediaRepository();

  /// 작품을 검색해요.
  Future<List<Media?>> searchMedias({
    required String query,
    int? page,
    int? perPage,
  });

  /// 작품 여럿을 불러와요.
  Future<List<Media?>> fetchMedias({
    int? page,
    int? perPage,
  });

  /// (경량) 작품 정보를 불러와요.
  Future<Media?> fetchMediaSlice({
    required MediaID id,
  });

  /// 작품 정보를 불러와요.
  Future<Media?> fetchMedia({
    required MediaID id,
  });

  /// 작품 반응을 불러와요.
  Future<List<MediaReaction?>> fetchReactions({
    required MediaID id,
  });

  /// 작품을 추가해요.
  Future<void> upsertMedia(
    Media media,
  );
}
