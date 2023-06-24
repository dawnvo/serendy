import 'package:serendy/src/core/infrastructure/infrastructure_module.dart';
import 'package:serendy/src/core/persistence/file_storage.dart';
import 'package:serendy/src/core/persistence/firestore_path.dart';
import 'package:serendy/src/features/collection/domain/usecases/add_collection_item_usecase.dart';
import 'package:serendy/src/features/collection/domain/usecases/create_collection_usecase.dart';
import 'package:serendy/src/features/collection/domain/usecases/delete_collection_item_usecase.dart';
import 'package:serendy/src/features/collection/domain/usecases/edit_collection_usecase.dart';
import 'package:serendy/src/features/collection/domain/usecases/get_collection_list_usecase.dart';
import 'package:serendy/src/features/collection/domain/usecases/get_collection_usecase.dart';
import 'package:serendy/src/features/collection/domain/usecases/remove_collection_usecase.dart';
import 'package:serendy/src/features/collection/domain/usecases/watch_collection_list_usecase.dart';
import 'package:serendy/src/features/collection/infrastructure/collection_repository_impl.dart';
import 'package:serendy/src/features/media/application/media_module.dart';
import 'package:serendy/src/features/user/application/user_module.dart';

abstract final class CollectionModule {
  // Persistence
  static final collectionRepository = CollectionRepositoryImpl(
    InfrastructureModule.firestore,
  );

  static final collectionFileStorage = FileStorageImpl(
    FirestorePath.collection,
    InfrastructureModule.storage,
  );

  // UseCase
  static final watchCollectionListUsecase = WatchCollectionListUsecase(
    CollectionModule.collectionRepository,
  );

  static final getCollectionListUsecase = GetCollectionListUsecase(
    CollectionModule.collectionRepository,
  );

  static final getCollectionUsecase = GetCollectionUsecase(
    CollectionModule.collectionRepository,
  );

  static final createCollectionUsecase = CreateCollectionUsecase(
    CollectionModule.collectionRepository,
    UserModule.userRepository,
  );

  static final editCollectionUsecase = EditCollectionUsecase(
    CollectionModule.collectionRepository,
    CollectionModule.collectionFileStorage,
  );

  static final removeCollectionUsecase = RemoveCollectionUsecase(
    CollectionModule.collectionRepository,
    CollectionModule.collectionFileStorage,
  );

  static final addCollectionItemUsecase = AddCollectionItemUsecase(
    CollectionModule.collectionRepository,
    MediaModule.mediaRepository,
  );

  static final deleteCollectionItemUsecase = DeleteCollectionItemUsecase(
    CollectionModule.collectionRepository,
  );
}
