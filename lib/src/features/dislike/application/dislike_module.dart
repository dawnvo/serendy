import 'package:serendy/src/features/dislike/domain/usecases/add_dislike_usecase.dart';
import 'package:serendy/src/features/dislike/domain/usecases/clear_dislikes_usecase.dart';
import 'package:serendy/src/features/dislike/infrastructure/dislike_repository_impl.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DislikeModule {
  // Persistence
  static final dislikeRepository = DislikeRepositoryImpl(
    Supabase.instance.client,
  );

  // UseCase
  static final addDislikeUsecase = AddDislikeUsecase(
    DislikeModule.dislikeRepository,
    UserModule.userRepository,
    MediaModule.mediaRepository,
  );

  static final clearDislikesUsecase = ClearDislikesUsecase(
    DislikeModule.dislikeRepository,
  );
}
