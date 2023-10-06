import 'package:serendy/src/features/media/media.dart';

abstract class MediaRepository {
  const MediaRepository();

  Future<List<Media?>> searchMedias({
    required String query,
  });

  Future<List<Media?>> fetchMediasList();

  Future<Media?> fetchMediaSlice({
    required MediaID id,
  });

  Future<Media?> fetchMedia({
    required MediaID id,
  });

  Future<void> insertMedia(Media media);
}
