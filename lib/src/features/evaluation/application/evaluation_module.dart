import 'package:serendy/src/features/evaluation/domain/usecases/count_evaluations_usecase.dart';
import 'package:serendy/src/features/evaluation/domain/usecases/get_evaluation_usecase.dart';
import 'package:serendy/src/features/evaluation/domain/usecases/get_evaluations_usecase.dart';
import 'package:serendy/src/features/evaluation/domain/usecases/remove_evaluation_usecase.dart';
import 'package:serendy/src/features/evaluation/domain/usecases/submit_evaluation_usecase.dart';
import 'package:serendy/src/features/evaluation/infrastructure/evaluation_repository_impl.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EvaluationModule {
  // Persistence
  static final evaluationRepository = EvaluationRepositoryImpl(
    Supabase.instance.client,
  );

  // UseCase
  static final getEvaluationsUsecase = GetEvaluationsUsecase(
    EvaluationModule.evaluationRepository,
  );

  static final countEvaluationsUsecase = CountEvaluationsUsecase(
    EvaluationModule.evaluationRepository,
  );

  static final getEvaluationUsecase = GetEvaluationUsecase(
    EvaluationModule.evaluationRepository,
  );

  static final submitEvaluationUsecase = SubmitEvaluationUsecase(
    EvaluationModule.evaluationRepository,
    UserModule.userRepository,
    MediaModule.mediaRepository,
  );

  static final removeEvaluationUsecase = RemoveEvaluationUsecase(
    EvaluationModule.evaluationRepository,
  );
}
