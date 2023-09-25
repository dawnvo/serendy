import 'package:serendy/src/features/evaluation/domain/usecases/count_evaluations_usecase.dart';
import 'package:serendy/src/features/evaluation/domain/usecases/get_evaluation_list_usecase.dart';
import 'package:serendy/src/features/evaluation/domain/usecases/get_evaluation_usecase.dart';
import 'package:serendy/src/features/evaluation/domain/usecases/remove_evaluation_usecase.dart';
import 'package:serendy/src/features/evaluation/domain/usecases/submit_evaluation_usecase.dart';
import 'package:serendy/src/features/evaluation/domain/usecases/watch_evaluation_list_usecase.dart';
import 'package:serendy/src/features/evaluation/infrastructure/evaluation_repository_impl.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';

class EvaluationModule {
  // Persistence
  static const evaluationRepository = EvaluationRepositoryImpl();

  // UseCase
  static const watchEvaluationListUsecase = WatchEvaluationListUsecase(
    EvaluationModule.evaluationRepository,
  );

  static const getEvaluationListUsecase = GetEvaluationListUsecase(
    EvaluationModule.evaluationRepository,
  );

  static const countEvaluationsUsecase = CountEvaluationsUsecase(
    EvaluationModule.evaluationRepository,
  );

  static const getEvaluationUsecase = GetEvaluationUsecase(
    EvaluationModule.evaluationRepository,
  );

  static const submitEvaluationUsecase = SubmitEvaluationUsecase(
    EvaluationModule.evaluationRepository,
    UserModule.userRepository,
    MediaModule.mediaRepository,
  );

  static const removeEvaluationUsecase = RemoveEvaluationUsecase(
    EvaluationModule.evaluationRepository,
  );
}
