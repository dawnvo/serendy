import 'package:serendy/features/media/media.dart';

abstract class MediaRepository {
  Future<Media?> getMedia(MediaID mediaId);

  Future<List<Media?>> search(String? title);

  Future<void> addMedia(Media media);
}
