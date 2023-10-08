import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/profile/profile.dart';

typedef GetEvaluationPayload = ({
  UserID userId,
  MediaID mediaId,
});

final class GetEvaluationUsecase implements UseCase<GetEvaluationPayload, Evaluation?> {
  const GetEvaluationUsecase(this._evaluationRepository);
  final EvaluationRepository _evaluationRepository;

  @override
  Future<Evaluation?> execute(GetEvaluationPayload payload) async {
    final evaluation = await _evaluationRepository.fetchEvaluation(
      userId: payload.userId,
      mediaId: payload.mediaId,
    );
    return evaluation;
  }
}
