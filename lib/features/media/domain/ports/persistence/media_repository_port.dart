import 'package:serendy/features/media/media.dart';

final class MediaSearchQuery {
  const MediaSearchQuery({this.title});
  final String? title;
}

abstract class MediaRepositoryPort {
  Future<Media?> getMedia(MediaID mediaId);

  Future<List<Media?>> search(MediaSearchQuery query);

  Future<void> addMedia(Media media);
}
