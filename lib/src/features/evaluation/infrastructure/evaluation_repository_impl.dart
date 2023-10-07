import 'package:serendy/src/configs/_mockup.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/profile/profile.dart';

final class EvaluationRepositoryImpl extends EvaluationRepository {
  const EvaluationRepositoryImpl();

  /**
   * 평가 여럿을 관찰해요.
   */
  @override
  Stream<List<Evaluation?>> watchEvaluations({
    UserID? userId,
    MediaID? mediaId,
  }) {
    return Stream.value(evaluationsMock);
  }

  /**
   * 평가 여럿을 불러와요.
   */
  @override
  Future<List<Evaluation?>> fetchEvaluations({
    UserID? userId,
    MediaID? mediaId,
  }) async {
    return evaluationsMock;
  }

  /**
   * 평가 수를 불러와요.
   */
  @override
  Future<int> countEvaluations({
    required UserID userId,
  }) async {
    return 800;
  }

  /**
   * (경량) 평가 정보를 불러와요.
   */
  @override
  Future<Evaluation?> fetchEvaluationSlice({
    required UserID userId,
    required MediaID mediaId,
  }) async {
    return evaluationsMock[0];
  }

  /**
   * 평가 정보를 불러와요.
   */
  @override
  Future<Evaluation?> fetchEvaluation({
    required UserID userId,
    required MediaID mediaId,
  }) async {
    return evaluationsMock[0];
  }

  /**
   * 평가를 만들어요.
   */
  @override
  Future<void> createEvaluation(
    Evaluation evaluation,
  ) async {
    throw UnimplementedError();
  }

  /**
   * 평가를 갱신해요.
   */
  @override
  Future<void> updateEvaluation(
    Evaluation evaluation,
  ) async {
    throw UnimplementedError();
  }
}
