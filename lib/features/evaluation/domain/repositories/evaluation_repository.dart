import 'package:serendy/features/evaluation/evaluation.dart';
import 'package:serendy/features/media/media.dart';
import 'package:serendy/features/user/user.dart';

abstract class EvaluationRepository {
  Stream<List<Evaluation?>> watchMany({UserID? userId, MediaID? mediaId});

  Future<List<Evaluation?>> findMany({UserID? userId, MediaID? mediaId});

  Future<Evaluation?> findOne(UserID userId, MediaID mediaId);

  Future<int> count(UserID userId);

  Future<void> create(Evaluation evaluation);

  Future<void> update(Evaluation evaluation);
}
