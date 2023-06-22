import 'package:serendy/core/locator.dart';
import 'package:serendy/features/media/domain/usecases/add_media_usecase.dart';
import 'package:serendy/features/media/domain/usecases/get_media_usecase.dart';
import 'package:serendy/features/media/domain/usecases/search_media_usecase.dart';
import 'package:serendy/features/media/infrastructure/media_repository_impl.dart';
import 'package:serendy/features/media/media.dart';

abstract final class MediaModule {
  static void dependencies() {
    // [Persistence]
    sl.registerSingleton<MediaRepository>(MediaRepositoryImpl(sl()));

    // [Service]
    sl.registerLazySingleton(() => GetMediaUsecase(sl()));
    sl.registerLazySingleton(() => SearchMediaUsecase(sl()));
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
