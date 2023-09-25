import 'package:serendy/src/core/_mock.dart';
import 'package:serendy/src/features/media/media.dart';

final class MediaRepositoryImpl implements MediaRepository {
  const MediaRepositoryImpl();

  @override
  Future<List<Media?>> search(String? title) async {
    return [];
  }

  @override
  Future<List<Media?>> findMany(int pageSize) async {
    return mediasMock;
  }

  @override
  Future<Media?> findOne(MediaID mediaId) async {
    return null;
  }

  /// Create media
  @override
  Future<void> create(Media media) async {
    throw UnimplementedError();
  }
}
