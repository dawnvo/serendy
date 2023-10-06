import 'package:serendy/src/configs/_mockup.dart';
import 'package:serendy/src/features/media/media.dart';

final class MediaRepositoryImpl implements MediaRepository {
  const MediaRepositoryImpl();

  /**
   * 작품을 검색해요.
   */
  @override
  Future<List<Media?>> searchMedias({
    required String query,
  }) async {
    return [];
  }

  /**
   * 작품을 여럿 불러와요.
   */
  @override
  Future<List<Media?>> fetchMediasList() async {
    return mediasMock;
  }

  /**
   * 작품 정보를 불러와요. (경량)
   */
  @override
  Future<Media?> fetchMediaSlice({
    required MediaID id,
  }) async {
    return null;
  }

  /**
   * 작품 정보를 불러와요.
   */
  @override
  Future<Media?> fetchMedia({
    required MediaID id,
  }) async {
    return null;
  }

  /**
   * 작품을 추가해요.
   */
  @override
  Future<void> insertMedia(Media media) async {
    throw UnimplementedError();
  }
}
