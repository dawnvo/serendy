import 'package:serendy/src/features/dislike/dislike.dart';
import 'package:serendy/src/features/dislike/domain/usecases/add_dislike_usecase.dart';
import 'package:serendy/src/features/dislike/domain/usecases/clear_dislikes_usecase.dart';
import 'package:serendy/src/features/dislike/infrastructure/dislike_repository_impl.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';
import 'package:serendy/src/configs/configs.dart';

part 'dislike_module.g.dart';

@riverpod
DislikeRepository dislikeRepository(DislikeRepositoryRef ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return DislikeRepositoryImpl(supabase);
}

@riverpod
AddDislikeUsecase addDislikeUsecase(AddDislikeUsecaseRef ref) {
  final dislikeRepository = ref.watch(dislikeRepositoryProvider);
  final userRepository = ref.watch(userRepositoryProvider);
  final mediaRepository = ref.watch(mediaRepositoryProvider);
  return AddDislikeUsecase(dislikeRepository, userRepository, mediaRepository);
}

@riverpod
ClearDislikesUsecase clearDislikesUsecase(ClearDislikesUsecaseRef ref) {
  final dislikeRepository = ref.watch(dislikeRepositoryProvider);
  return ClearDislikesUsecase(dislikeRepository);
}
