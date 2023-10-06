import 'package:serendy/src/core/_mock.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/profile/profile.dart';

final class EvaluationRepositoryImpl extends EvaluationRepository {
  const EvaluationRepositoryImpl();

  /**
   * 평가를 여럿 관찰해요.
   */
  @override
  Stream<List<Evaluation?>> watchEvaluationsList({
    UserID? userId,
    MediaID? mediaId,
  }) {
    final list = List.filled(16, evaluationMock);
    return Stream.value(list);
  }

  /**
   * 평가를 여럿 불러와요.
   */
  @override
  Future<List<Evaluation?>> fetchEvaluationsList({
    UserID? userId,
    MediaID? mediaId,
  }) async {
    return List.filled(16, evaluationMock);
  }

  /**
   * 평가 정보를 불러와요. (경량)
   */
  @override
  Future<Evaluation?> fetchEvaluationSlice({
    required UserID userId,
    required MediaID mediaId,
  }) async {
    return evaluationMock;
  }

  /**
   * 평가 정보를 불러와요.
   */
  @override
  Future<Evaluation?> fetchEvaluation({
    required UserID userId,
    required MediaID mediaId,
  }) async {
    return evaluationMock;
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
   * 평가를 만들어요.
   */
  @override
  Future<void> createEvaluation(Evaluation evaluation) async {
    throw UnimplementedError();
  }

  /**
   * 평가를 갱신해요.
   */
  @override
  Future<void> updateEvaluation(Evaluation evaluation) async {
    throw UnimplementedError();
  }
}
