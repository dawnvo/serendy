import 'package:serendy/core/core.dart';
import 'package:serendy/features/collection/application/create_collection_service.dart';
import 'package:serendy/features/collection/application/edit_collection_service.dart';
import 'package:serendy/features/collection/application/get_collection_service.dart';
import 'package:serendy/features/collection/application/get_collections_list_service.dart';
import 'package:serendy/features/collection/application/remove_collection_service.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/data/collection_repository_remote.dart';

abstract final class CollectionModule {
  const CollectionModule._();
  static void dependencies() {
    // UseCases
    sl.registerLazySingleton<GetCollectionUseCase>(
        () => GetCollectionService(sl()));
    sl.registerLazySingleton<GetCollectionsListUseCase>(
        () => GetCollectionsListService(sl()));
    sl.registerLazySingleton<CreateCollectionUseCase>(
        () => CreateCollectionService(sl()));
    sl.registerLazySingleton<EditCollectionUseCase>(
        () => EditCollectionService(sl()));
    sl.registerLazySingleton<RemoveCollectionUseCase>(
        () => RemoveCollectionService(sl()));

    // Rrepositories
    sl.registerLazySingleton<CollectionRepository>(
        () => CollectionRepositoryRemote(sl()));
  }
}
