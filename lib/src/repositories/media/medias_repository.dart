import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/_mock.dart';
import 'package:serendy/src/models/models.dart';

part 'medias_repository.g.dart';

final class MediasRepository {
  final List<Media?> _medias = [mediaMock];

  Future<List<Media?>> fetchMediasList() async {
    return Future.value(_medias);
  }

  Stream<List<Media?>> watchMediasList() async* {
    yield _medias;
  }

  Future<Media?> fetchMedia(String id) async {
    return Future.value(_medias[0]);
  }

  Stream<Media?> watchMedia(String id) {
    return watchMediasList().map((medias) => medias[0]);
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
MediasRepository mediasRepository(MediasRepositoryRef ref) {
  return MediasRepository();
}
