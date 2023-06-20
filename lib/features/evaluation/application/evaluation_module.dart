import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:serendy/core/locator.dart';
import 'package:serendy/features/evaluation/application/evaluation_service.dart';
import 'package:serendy/features/evaluation/data/repositories/evaluation_repository.dart';
import 'package:serendy/features/evaluation/domain/ports/persistence/evaluation_repository_port.dart';
import 'package:serendy/features/evaluation/domain/usecases/count_evaluations_usecase.dart';
import 'package:serendy/features/evaluation/domain/usecases/get_evaluation_list_usecase.dart';
import 'package:serendy/features/evaluation/domain/usecases/get_evaluation_usecase.dart';
import 'package:serendy/features/evaluation/domain/usecases/remove_evaluation_usecase.dart';
import 'package:serendy/features/evaluation/domain/usecases/submit_evaluation_usecase.dart';
import 'package:serendy/features/evaluation/domain/usecases/watch_evaluation_list_usecase.dart';
import 'package:serendy/features/media/domain/ports/persistence/media_repository_port.dart';
import 'package:serendy/features/user/domain/ports/persistence/user_repository_port.dart';

abstract final class EvaluationModule {
  static void dependencies() {
    // [Persistence]
    sl.registerSingleton<EvaluationRepositoryPort>(
      EvaluationRepository(sl<FirebaseFirestore>()),
    );

    // [UseCase]
    sl.registerLazySingleton<WatchEvaluationListUsecase>(
      () => WatchEvaluationListUsecase(
        sl<EvaluationRepositoryPort>(),
      ),
    );
    sl.registerLazySingleton<GetEvaluationListUsecase>(
      () => GetEvaluationListUsecase(
        sl<EvaluationRepositoryPort>(),
      ),
    );

    sl.registerLazySingleton<GetEvaluationUsecase>(
      () => GetEvaluationUsecase(
        sl<EvaluationRepositoryPort>(),
      ),
    );
    sl.registerLazySingleton<CountEvaluationsUsecase>(
      () => CountEvaluationsUsecase(
        sl<EvaluationRepositoryPort>(),
      ),
    );
    sl.registerLazySingleton<SubmitEvaluationUsecase>(
      () => SubmitEvaluationUsecase(
        sl<EvaluationRepositoryPort>(),
        sl<UserRepositoryPort>(),
        sl<MediaRepositoryPort>(),
      ),
    );
    sl.registerLazySingleton<RemoveEvaluationUsecase>(
      () => RemoveEvaluationUsecase(
        sl<EvaluationRepositoryPort>(),
      ),
    );

    // [Service]
    sl.registerLazySingleton<EvaluationService>(
      () => EvaluationService(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
  }
}
