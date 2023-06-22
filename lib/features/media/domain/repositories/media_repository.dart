import 'package:serendy/features/media/media.dart';

abstract class MediaRepository {
  Future<List<Media?>> findMany(String? title);

  Future<Media?> findOne(MediaID mediaId);

  Future<void> create(Media media);
}
