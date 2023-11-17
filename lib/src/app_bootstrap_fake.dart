import 'package:serendy/src/app_bootstrap.dart';
import 'package:serendy/src/configs/configs.dart';

import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/user/user.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/features/dislike/dislike.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';

import 'package:serendy/src/features/auth/infrastructure/auth_repository_fake.dart';
import 'package:serendy/src/features/user/infrastructure/user_repository_fake.dart';
import 'package:serendy/src/features/media/infrastructure/media_repository_fake.dart';
import 'package:serendy/src/features/theme/infrastructure/theme_repository_fake.dart';
import 'package:serendy/src/features/dislike/infrastructure/dislike_repository_fake.dart';
import 'package:serendy/src/features/evaluation/infrastructure/evaluation_repository_fake.dart';

extension AppBootstrapFake on AppBootstrap {
  Future<ProviderContainer> createFakeProviderContainer() async {
    final authRepository = AuthRepositoryFake();
    final userRepository = UserRepositoryFake();
    final mediaRepository = MediaRepositoryFake();
    final themeRepository = ThemeRepositoryFake();
    final dislikeRepository = DislikeRepositoryFake();
    final evaluationRepository = EvaluationRepositoryFake();

    return ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(authRepository),
        userRepositoryProvider.overrideWithValue(userRepository),
        mediaRepositoryProvider.overrideWithValue(mediaRepository),
        themeRepositoryProvider.overrideWithValue(themeRepository),
        dislikeRepositoryProvider.overrideWithValue(dislikeRepository),
        evaluationRepositoryProvider.overrideWithValue(evaluationRepository),
      ],
      observers: [
        DebugObserver(),
        ErrorObserver(),
        RankObserver(),
      ],
    );
  }
}
