import 'package:serendy/core/locator.dart';
import 'package:serendy/core/persistence/file_storage.dart';
import 'package:serendy/core/persistence/firestore_path.dart';
import 'package:serendy/features/collection/collection.dart';
import 'package:serendy/features/collection/domain/usecases/add_collection_item_usecase.dart';
import 'package:serendy/features/collection/domain/usecases/create_collection_usecase.dart';
import 'package:serendy/features/collection/domain/usecases/delete_collection_item_usecase.dart';
import 'package:serendy/features/collection/domain/usecases/edit_collection_usecase.dart';
import 'package:serendy/features/collection/domain/usecases/get_collection_list_usecase.dart';
import 'package:serendy/features/collection/domain/usecases/get_collection_usecase.dart';
import 'package:serendy/features/collection/domain/usecases/remove_collection_usecase.dart';
import 'package:serendy/features/collection/domain/usecases/watch_collection_list_usecase.dart';
import 'package:serendy/features/collection/infrastructure/collection_repository_impl.dart';

abstract final class CollectionModule {
  static const _instance = 'CollectionModule';
  static void dependencies() {
    // [Persistence]
    sl.registerSingleton<CollectionRepository>(CollectionRepositoryImpl(sl()));
    sl.registerSingleton<FileStorage>(
      FileStorageImpl(FirestorePath.collection, sl()),
      instanceName: _instance,
    );

    // [UseCase]
    sl.registerLazySingleton(() => GetCollectionUsecase(sl()));
    sl.registerLazySingleton(() => GetCollectionListUsecase(sl()));
    sl.registerLazySingleton(() => WatchCollectionListUsecase(sl()));
    sl.registerLazySingleton(() => CreateCollectionUsecase(sl(), sl()));
    sl.registerLazySingleton(
        () => EditCollectionUsecase(sl(), sl(instanceName: _instance)));
    sl.registerLazySingleton(
        () => RemoveCollectionUsecase(sl(), sl(instanceName: _instance)));
    sl.registerLazySingleton(() => AddCollectionItemUsecase(sl(), sl()));
    sl.registerLazySingleton(() => DeleteCollectionItemUsecase(sl()));

    // [Service]
    sl.registerLazySingleton(
      () => CollectionService(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
  }
}
