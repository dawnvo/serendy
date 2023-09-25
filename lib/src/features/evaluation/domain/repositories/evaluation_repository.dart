import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';

abstract class EvaluationRepository {
  const EvaluationRepository();

  Stream<List<Evaluation?>> watchMany(UserID userId);

  Future<List<Evaluation?>> findMany(MediaID mediaId);

  Future<Evaluation?> findOne(UserID userId, MediaID mediaId);

  Future<int> count(UserID userId);

  Future<void> create(Evaluation evaluation);

  Future<void> update(Evaluation evaluation);
}
