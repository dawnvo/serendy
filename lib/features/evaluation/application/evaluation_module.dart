import 'package:serendy/core/locator.dart';
import 'package:serendy/features/evaluation/domain/usecases/count_evaluations_usecase.dart';
import 'package:serendy/features/evaluation/domain/usecases/get_evaluation_list_usecase.dart';
import 'package:serendy/features/evaluation/domain/usecases/get_evaluation_usecase.dart';
import 'package:serendy/features/evaluation/domain/usecases/remove_evaluation_usecase.dart';
import 'package:serendy/features/evaluation/domain/usecases/submit_evaluation_usecase.dart';
import 'package:serendy/features/evaluation/domain/usecases/watch_evaluation_list_usecase.dart';
import 'package:serendy/features/evaluation/evaluation.dart';
import 'package:serendy/features/evaluation/infrastructure/evaluation_repository_impl.dart';

abstract final class EvaluationModule {
  static void dependencies() {
    // [Persistence]
    sl.registerSingleton<EvaluationRepository>(EvaluationRepositoryImpl(sl()));

    // [UseCase]
    sl.registerLazySingleton(() => WatchEvaluationListUsecase(sl()));
    sl.registerLazySingleton(() => GetEvaluationListUsecase(sl()));
    sl.registerLazySingleton(() => GetEvaluationUsecase(sl()));
    sl.registerLazySingleton(() => CountEvaluationsUsecase(sl()));
    sl.registerLazySingleton(() => SubmitEvaluationUsecase(sl(), sl(), sl()));
    sl.registerLazySingleton(() => RemoveEvaluationUsecase(sl()));

    // [Service]
    sl.registerLazySingleton(
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
