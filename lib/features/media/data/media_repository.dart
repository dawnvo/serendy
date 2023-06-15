import 'package:serendy/features/media/domain/media.dart';

abstract class MediaRepository {
  Future<List<Media?>> fetchMediaList();

  Stream<List<Media?>> watchMediaList();

  Future<Media?> fetchMedia(String id);

  Stream<Media?> watchMedia(String id);
}
