import 'package:serendy/configs/configs.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/data/collection_repository_remote.dart';
import 'package:serendy/features/evaluation/data/evaluation_repository.dart';
import 'package:serendy/features/evaluation/data/evaluation_repository_remote.dart';
import 'package:serendy/features/media/data/media_repository.dart';
import 'package:serendy/features/media/data/media_repository_remote.dart';
import 'package:serendy/features/user/data/user_repository.dart';
import 'package:serendy/features/user/data/user_repository_remote.dart';

abstract final class DataModule {
  static void dependencies() {
    sl.registerLazySingleton<UserRepository>(() => UserRepositoryRemote(sl()));
    sl.registerLazySingleton<MediaRepository>(
        () => MediaRepositoryRemote(sl()));
    sl.registerLazySingleton<CollectionRepository>(
        () => CollectionRepositoryRemote(sl()));
    sl.registerLazySingleton<EvaluationRepository>(
        () => EvaluationRepositoryRemote(sl()));
  }
}
