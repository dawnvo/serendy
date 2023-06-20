import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/features/evaluation/domain/ports/persistence/evaluation_repository_port.dart';
import 'package:serendy/features/evaluation/domain/ports/usecases/get_evaluation_port.dart';
import 'package:serendy/features/evaluation/evaluation.dart';

final class GetEvaluationUsecase
    implements UseCase<GetEvaluationPort, Evaluation?> {
  const GetEvaluationUsecase(this._evaluationRepository);

  final EvaluationRepositoryPort _evaluationRepository;

  @override
  Future<Evaluation?> execute(GetEvaluationPort payload) async {
    final evaluation =
        await _evaluationRepository.findOne(payload.userId, payload.mediaId);
    return evaluation;
  }
}
