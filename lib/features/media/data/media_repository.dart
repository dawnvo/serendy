import 'package:serendy/features/media/domain/media.dart';

abstract class MediaRepository {
  Future<List<Media?>> fetchMediasList();

  Future<Media> fetchMedia({required String mediaId});

  Future<void> addMedia({required Media media});
}
