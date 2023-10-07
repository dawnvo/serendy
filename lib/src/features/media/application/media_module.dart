import 'package:serendy/src/features/media/domain/usecases/add_media_usecase.dart';
import 'package:serendy/src/features/media/domain/usecases/get_media_usecase.dart';
import 'package:serendy/src/features/media/domain/usecases/get_medias_usecase.dart';
import 'package:serendy/src/features/media/domain/usecases/search_medias_usecase.dart';
import 'package:serendy/src/features/media/infrastructure/media_repository_impl.dart';

abstract final class MediaModule {
  // Persistence
  static const mediaRepository = MediaRepositoryImpl();

  // UseCase
  static const searchMediasUsecase = SearchMediasUsecase(
    MediaModule.mediaRepository,
  );

  static const getMediasUsecase = GetMediasUsecase(
    MediaModule.mediaRepository,
  );

  static const getMediaUsecase = GetMediaUsecase(
    MediaModule.mediaRepository,
  );

  static const addMediaUsecase = AddMediaUsecase(
    MediaModule.mediaRepository,
  );
}
