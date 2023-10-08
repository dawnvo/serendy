import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/profile/profile.dart';

abstract class EvaluationRepository {
  const EvaluationRepository();

  /// 평가 여럿을 불러와요.
  Future<List<Evaluation?>> fetchEvaluations({
    UserID? userId,
    MediaID? mediaId,
  });

  /// 평가 수를 불러와요.
  Future<int> countEvaluations({
    required UserID userId,
  });

  /// (경량) 평가 정보를 불러와요.
  Future<Evaluation?> fetchEvaluationSlice({
    required UserID userId,
    required MediaID mediaId,
  });

  /// 평가 정보를 불러와요.
  Future<Evaluation?> fetchEvaluation({
    required UserID userId,
    required MediaID mediaId,
  });

  /// 평가를 만들어요.
  Future<void> createEvaluation(
    Evaluation evaluation,
  );

  /// 평가를 갱신해요.
  Future<void> updateEvaluation(
    Evaluation evaluation,
  );
}
