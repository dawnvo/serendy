import 'package:serendy/src/features/media/media.dart';

abstract class MediaRepository {
  Future<List<Media?>> search(String? title);

  Future<List<Media?>> findMany(int pageKey);

  Future<Media?> findOne(MediaID mediaId);

  Future<void> create(Media media);
}
