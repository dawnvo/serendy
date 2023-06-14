import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/_mock.dart';
import 'package:serendy/features/media/domain/media.dart';

part 'media_repository.g.dart';

final class MediaRepository {
  final List<Media?> _media = [mediaMock];

  Future<List<Media?>> fetchMediaList() async {
    return Future.value(_media);
  }

  Stream<List<Media?>> watchMediaList() async* {
    yield _media;
  }

  Future<Media?> fetchMedia(String id) async {
    return Future.value(_media[0]);
  }

  Stream<Media?> watchMedia(String id) {
    return watchMediaList().map((media) => media[0]);
  }

  Future<void> createMedia(String id, String imageUrl) {
    throw UnimplementedError();
  }

  Future<void> updateMedia(Media media) {
    throw UnimplementedError();
  }

  Future<void> deleteMedia(String id) {
    throw UnimplementedError();
  }
}

@riverpod
MediaRepository mediaRepository(MediaRepositoryRef ref) {
  return MediaRepository();
}
