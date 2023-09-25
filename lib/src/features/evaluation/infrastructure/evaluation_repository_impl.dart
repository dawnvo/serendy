import 'package:serendy/src/core/_mock.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';

final class EvaluationRepositoryImpl extends EvaluationRepository {
  const EvaluationRepositoryImpl();

  @override
  Stream<List<Evaluation?>> watchMany(UserID userId) {
    final list = List.filled(16, evaluationMock);
    return Stream.value(list);
  }

  @override
  Future<List<Evaluation?>> findMany(MediaID? mediaId) async {
    return List.filled(16, evaluationMock);
  }

  @override
  Future<Evaluation?> findOne(UserID userId, MediaID mediaId) async {
    return evaluationMock;
  }

  @override
  Future<int> count(UserID userId) async {
    return 800;
  }

  @override
  Future<void> create(Evaluation evaluation) async {
    throw UnimplementedError();
  }

  @override
  Future<void> update(Evaluation evaluation) async {
    throw UnimplementedError();
  }
}
