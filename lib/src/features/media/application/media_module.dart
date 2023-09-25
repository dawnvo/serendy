import 'package:serendy/src/features/media/domain/usecases/add_media_usecase.dart';
import 'package:serendy/src/features/media/domain/usecases/get_media_list_usecase.dart';
import 'package:serendy/src/features/media/domain/usecases/get_media_usecase.dart';
import 'package:serendy/src/features/media/domain/usecases/search_media_usecase.dart';
import 'package:serendy/src/features/media/infrastructure/media_repository_impl.dart';

abstract final class MediaModule {
  // Persistence
  static const mediaRepository = MediaRepositoryImpl();

  // UseCase
  static const searchMediaUsecase = SearchMediaUsecase(
    MediaModule.mediaRepository,
  );

  static const getMediaListUsecase = GetMediaListUsecase(
    MediaModule.mediaRepository,
  );

  static const getMediaUsecase = GetMediaUsecase(
    MediaModule.mediaRepository,
  );

  static const addMediaUsecase = AddMediaUsecase(
    MediaModule.mediaRepository,
  );
}
