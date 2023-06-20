import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:serendy/core/locator.dart';
import 'package:serendy/core/network/firestore_path.dart';
import 'package:serendy/core/network/media_file_storage.dart';
import 'package:serendy/features/collection/application/collection_service.dart';
import 'package:serendy/features/collection/data/repositories/collection_repository.dart';
import 'package:serendy/features/collection/domain/ports/persistence/collection_repository_port.dart';
import 'package:serendy/features/collection/domain/usecases/add_collection_item_usecase.dart';
import 'package:serendy/features/collection/domain/usecases/create_collection_usecase.dart';
import 'package:serendy/features/collection/domain/usecases/delete_collection_item_usecase.dart';
import 'package:serendy/features/collection/domain/usecases/edit_collection_usecase.dart';
import 'package:serendy/features/collection/domain/usecases/get_collection_list_usecase.dart';
import 'package:serendy/features/collection/domain/usecases/get_collection_usecase.dart';
import 'package:serendy/features/collection/domain/usecases/remove_collection_usecase.dart';
import 'package:serendy/features/collection/domain/usecases/watch_collection_list_usecase.dart';
import 'package:serendy/features/media/domain/ports/persistence/media_repository_port.dart';
import 'package:serendy/features/user/domain/ports/persistence/user_repository_port.dart';

abstract final class CollectionModule {
  static const _key = 'CollectionModule';
  static void dependencies() {
    // [Persistence]
    sl.registerSingleton<CollectionRepositoryPort>(
      CollectionRepository(sl<FirebaseFirestore>()),
    );
    sl.registerLazySingleton<MediaFileStoragePort>(
      instanceName: _key,
      () => MediaFileStorage(
        FirestorePath.collection,
        sl<FirebaseStorage>(),
      ),
    );

    // [UseCase]
    sl.registerLazySingleton<GetCollectionUsecase>(
      () => GetCollectionUsecase(
        sl<CollectionRepositoryPort>(),
      ),
    );
    sl.registerLazySingleton<GetCollectionListUsecase>(
      () => GetCollectionListUsecase(
        sl<CollectionRepositoryPort>(),
      ),
    );
    sl.registerLazySingleton<WatchCollectionListUsecase>(
      () => WatchCollectionListUsecase(
        sl<CollectionRepositoryPort>(),
      ),
    );
    sl.registerLazySingleton<CreateCollectionUsecase>(
      () => CreateCollectionUsecase(
        sl<CollectionRepositoryPort>(),
        sl<UserRepositoryPort>(),
      ),
    );
    sl.registerLazySingleton<EditCollectionUsecase>(
      () => EditCollectionUsecase(
        sl<CollectionRepositoryPort>(),
        sl<MediaFileStoragePort>(instanceName: _key),
      ),
    );
    sl.registerLazySingleton<RemoveCollectionUsecase>(
      () => RemoveCollectionUsecase(
        sl<CollectionRepositoryPort>(),
        sl<MediaFileStoragePort>(instanceName: _key),
      ),
    );
    sl.registerLazySingleton<AddCollectionItemUsecase>(
      () => AddCollectionItemUsecase(
        sl<CollectionRepositoryPort>(),
        sl<MediaRepositoryPort>(),
      ),
    );
    sl.registerLazySingleton<DeleteCollectionItemUsecase>(
      () => DeleteCollectionItemUsecase(
        sl<CollectionRepositoryPort>(),
      ),
    );

    // [Service]
    sl.registerLazySingleton<CollectionService>(
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
