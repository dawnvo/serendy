import 'package:serendy/src/core/infrastructure/infrastructure_module.dart';
import 'package:serendy/src/features/media/domain/usecases/add_media_usecase.dart';
import 'package:serendy/src/features/media/domain/usecases/get_media_usecase.dart';
import 'package:serendy/src/features/media/domain/usecases/search_media_usecase.dart';
import 'package:serendy/src/features/media/infrastructure/media_repository_impl.dart';

abstract final class MediaModule {
  // Persistence
  static final mediaRepository = MediaRepositoryImpl(
    InfrastructureModule.firestore,
  );

  // UseCase
  static final searchMediaUsecase = SearchMediaUsecase(
    MediaModule.mediaRepository,
  );

  static final getMediaUsecase = GetMediaUsecase(
    MediaModule.mediaRepository,
  );

  static final addMediaUsecase = AddMediaUsecase(
    MediaModule.mediaRepository,
  );
}
