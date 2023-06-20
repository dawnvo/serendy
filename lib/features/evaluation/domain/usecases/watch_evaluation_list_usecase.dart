import 'package:serendy/core/domain/usecase.dart';
import 'package:serendy/features/evaluation/domain/ports/persistence/evaluation_repository_port.dart';
import 'package:serendy/features/evaluation/domain/ports/usecases/watch_evaluation_list_port.dart';
import 'package:serendy/features/evaluation/evaluation.dart';

final class WatchEvaluationListUsecase
    implements StreamUseCase<WatchEvaluationListPort, List<Evaluation?>> {
  const WatchEvaluationListUsecase(this._evaluationRepository);

  final EvaluationRepositoryPort _evaluationRepository;

  @override
  Stream<List<Evaluation?>> execute(WatchEvaluationListPort payload) {
    final evaluations = _evaluationRepository.watchMany(
      userId: payload.userId,
      mediaId: payload.mediaId,
    );
    return evaluations;
  }
}
