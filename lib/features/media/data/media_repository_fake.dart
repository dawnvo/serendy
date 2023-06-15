import 'package:serendy/_mock.dart';
import 'package:serendy/features/media/data/media_repository.dart';
import 'package:serendy/features/media/domain/media.dart';

final class MediaRepositoryFake extends MediaRepository {
  final List<Media?> _media = [mediaMock];

  @override
  Future<List<Media?>> fetchMediaList() async {
    return _media;
  }

  @override
  Stream<List<Media?>> watchMediaList() async* {
    yield _media;
  }

  @override
  Future<Media?> fetchMedia(String id) async {
    return _media[0];
  }

  @override
  Stream<Media?> watchMedia(String id) {
    return watchMediaList().map((medias) => medias[0]);
  }
}
