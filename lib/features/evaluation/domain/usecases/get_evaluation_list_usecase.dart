import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/features/evaluation/domain/ports/persistence/evaluation_repository_port.dart';
import 'package:serendy/features/evaluation/domain/ports/usecases/get_evaluation_list_port.dart';
import 'package:serendy/features/evaluation/evaluation.dart';

final class GetEvaluationListUsecase
    implements UseCase<GetEvaluationListPort, List<Evaluation?>> {
  const GetEvaluationListUsecase(this._evaluationRepository);

  final EvaluationRepositoryPort _evaluationRepository;

  @override
  Future<List<Evaluation?>> execute(GetEvaluationListPort payload) {
    final evaluations = _evaluationRepository.findMany(
      userId: payload.userId,
      mediaId: payload.mediaId,
    );
    return evaluations;
  }
}
