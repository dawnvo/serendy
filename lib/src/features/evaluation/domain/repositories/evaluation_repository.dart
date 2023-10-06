import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/profile/profile.dart';

abstract class EvaluationRepository {
  const EvaluationRepository();

  Stream<List<Evaluation?>> watchEvaluationsList({
    UserID? userId,
    MediaID? mediaId,
  });

  Future<List<Evaluation?>> fetchEvaluationsList({
    UserID? userId,
    MediaID? mediaId,
  });

  Future<Evaluation?> fetchEvaluationSlice({
    required UserID userId,
    required MediaID mediaId,
  });

  Future<Evaluation?> fetchEvaluation({
    required UserID userId,
    required MediaID mediaId,
  });

  Future<int> countEvaluations({
    required UserID userId,
  });

  Future<void> createEvaluation(Evaluation evaluation);

  Future<void> updateEvaluation(Evaluation evaluation);
}
