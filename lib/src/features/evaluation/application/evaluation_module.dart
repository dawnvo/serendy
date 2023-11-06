import 'package:serendy/src/features/evaluation/domain/usecases/count_evaluations_usecase.dart';
import 'package:serendy/src/features/evaluation/domain/usecases/get_evaluation_usecase.dart';
import 'package:serendy/src/features/evaluation/domain/usecases/get_evaluations_usecase.dart';
import 'package:serendy/src/features/evaluation/domain/usecases/remove_evaluation_usecase.dart';
import 'package:serendy/src/features/evaluation/domain/usecases/submit_evaluation_usecase.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/evaluation/infrastructure/evaluation_repository_impl.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';
import 'package:serendy/src/configs/configs.dart';

part 'evaluation_module.g.dart';

@riverpod
EvaluationRepository evaluationRepository(EvaluationRepositoryRef ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return EvaluationRepositoryImpl(supabase);
}

@riverpod
CountEvaluationsUsecase countEvaluationsUsecase(CountEvaluationsUsecaseRef ref) {
  final evaluationRepository = ref.watch(evaluationRepositoryProvider);
  return CountEvaluationsUsecase(evaluationRepository);
}

@riverpod
GetEvaluationsUsecase getEvaluationsUsecase(GetEvaluationsUsecaseRef ref) {
  final evaluationRepository = ref.watch(evaluationRepositoryProvider);
  return GetEvaluationsUsecase(evaluationRepository);
}

@riverpod
GetEvaluationUsecase getEvaluationUsecase(GetEvaluationUsecaseRef ref) {
  final evaluationRepository = ref.watch(evaluationRepositoryProvider);
  return GetEvaluationUsecase(evaluationRepository);
}

@riverpod
SubmitEvaluationUsecase submitEvaluationUsecase(SubmitEvaluationUsecaseRef ref) {
  final evaluationRepository = ref.watch(evaluationRepositoryProvider);
  final userRepository = ref.watch(userRepositoryProvider);
  final mediaRepository = ref.watch(mediaRepositoryProvider);
  return SubmitEvaluationUsecase(evaluationRepository, userRepository, mediaRepository);
}

@riverpod
RemoveEvaluationUsecase removeEvaluationUsecase(RemoveEvaluationUsecaseRef ref) {
  final evaluationRepository = ref.watch(evaluationRepositoryProvider);
  return RemoveEvaluationUsecase(evaluationRepository);
}
