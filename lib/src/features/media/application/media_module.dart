import 'package:serendy/src/features/media/domain/usecases/add_media_usecase.dart';
import 'package:serendy/src/features/media/domain/usecases/get_media_reactions_usecase.dart';
import 'package:serendy/src/features/media/domain/usecases/get_media_usecase.dart';
import 'package:serendy/src/features/media/domain/usecases/get_medias_usecase.dart';
import 'package:serendy/src/features/media/domain/usecases/search_medias_usecase.dart';
import 'package:serendy/src/features/media/infrastructure/media_repository_impl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract final class MediaModule {
  //persistence
  static final mediaRepository = MediaRepositoryImpl(
    Supabase.instance.client,
  );

  //use-case
  static final searchMediasUsecase = SearchMediasUsecase(
    MediaModule.mediaRepository,
  );

  static final getMediasUsecase = GetMediasUsecase(
    MediaModule.mediaRepository,
  );

  static final getMediaUsecase = GetMediaUsecase(
    MediaModule.mediaRepository,
  );

  static final getMediaReactionsUsecase = GetMediaReactionsUsecase(
    MediaModule.mediaRepository,
  );

  static final addMediaUsecase = AddMediaUsecase(
    MediaModule.mediaRepository,
  );
}
