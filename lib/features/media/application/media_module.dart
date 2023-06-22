import 'package:serendy/core/locator.dart';
import 'package:serendy/features/media/application/media_service.dart';
import 'package:serendy/features/media/domain/usecases/add_media_usecase.dart';
import 'package:serendy/features/media/domain/usecases/get_media_list_usecase.dart';
import 'package:serendy/features/media/domain/usecases/get_media_usecase.dart';
import 'package:serendy/features/media/infrastructure/media_repository_impl.dart';

abstract final class MediaModule {
  static void dependencies() {
    // [Persistence]
    sl.registerSingleton(MediaRepositoryImpl(sl()));

    // [Service]
    sl.registerLazySingleton(() => GetMediaUsecase(sl()));
    sl.registerLazySingleton(() => GetMediaListUsecase(sl()));
    sl.registerLazySingleton(() => AddMediaUsecase(sl()));

    // [Service]
    sl.registerLazySingleton(
      () => MediaService(
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
  }
}
