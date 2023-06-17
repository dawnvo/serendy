import 'package:serendy/configs/configs.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/data/collection_repository_remote.dart';

abstract final class DataModule {
  static void dependencies() {
    sl.registerLazySingleton<CollectionRepository>(
        () => CollectionRepositoryRemote(sl()));
  }
}
