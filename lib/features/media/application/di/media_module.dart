import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:serendy/core/locator.dart';
import 'package:serendy/features/media/application/services/media_service.dart';
import 'package:serendy/features/media/data/repositories/media_repository.dart';
import 'package:serendy/features/media/domain/ports/persistence/media_repository_port.dart';
import 'package:serendy/features/media/domain/usecases/add_media_usecase.dart';
import 'package:serendy/features/media/domain/usecases/get_media_list_usecase.dart';
import 'package:serendy/features/media/domain/usecases/get_media_usecase.dart';

abstract final class MediaModule {
  static void dependencies() {
    // [Persistence]
    sl.registerSingleton<MediaRepositoryPort>(
      MediaRepository(sl<FirebaseFirestore>()),
    );

    // [UseCase]
    sl.registerLazySingleton<GetMediaUsecase>(
      () => GetMediaUsecase(
        sl<MediaRepositoryPort>(),
      ),
    );
    sl.registerLazySingleton<GetMediaListUsecase>(
      () => GetMediaListUsecase(
        sl<MediaRepositoryPort>(),
      ),
    );
    sl.registerLazySingleton<AddMediaUsecase>(
      () => AddMediaUsecase(
        sl<MediaRepositoryPort>(),
      ),
    );

    // [Service]
    sl.registerLazySingleton<MediaService>(
      () => MediaService(
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
  }
}
