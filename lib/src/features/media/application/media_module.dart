import 'package:serendy/src/features/media/domain/usecases/get_media_reactions_usecase.dart';
import 'package:serendy/src/features/media/domain/usecases/get_media_usecase.dart';
import 'package:serendy/src/features/media/domain/usecases/get_medias_usecase.dart';
import 'package:serendy/src/features/media/domain/usecases/search_medias_usecase.dart';
import 'package:serendy/src/features/media/infrastructure/media_repository_impl.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/configs/configs.dart';

part 'media_module.g.dart';

@riverpod
MediaRepository mediaRepository(MediaRepositoryRef ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return MediaRepositoryImpl(supabase);
}

@riverpod
SearchMediasUsecase searchMediasUsecase(SearchMediasUsecaseRef ref) {
  final mediaRepository = ref.watch(mediaRepositoryProvider);
  return SearchMediasUsecase(mediaRepository);
}

@riverpod
GetMediasUsecase getMediasUsecase(GetMediasUsecaseRef ref) {
  final mediaRepository = ref.watch(mediaRepositoryProvider);
  return GetMediasUsecase(mediaRepository);
}

@riverpod
GetMediaUsecase getMediaUsecase(GetMediaUsecaseRef ref) {
  final mediaRepository = ref.watch(mediaRepositoryProvider);
  return GetMediaUsecase(mediaRepository);
}

@riverpod
GetMediaReactionsUsecase getMediaReactionsUsecase(GetMediaReactionsUsecaseRef ref) {
  final mediaRepository = ref.watch(mediaRepositoryProvider);
  return GetMediaReactionsUsecase(mediaRepository);
}
