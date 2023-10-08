import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/profile/profile.dart';

import 'evaluation_mapper.dart';

final class EvaluationRepositoryImpl extends EvaluationRepository {
  const EvaluationRepositoryImpl(this.supabase);
  final SupabaseClient supabase;

  static const String _tableEvaluations = TablePath.evaluations;

  /**
   * 평가 여럿을 불러와요.
   */
  @override
  Future<List<Evaluation?>> fetchEvaluations({
    UserID? userId,
    MediaID? mediaId,
  }) {
    const columns = '''
      id,
      emotion,
      media_id,
      medias ( title, image )
    ''';
    final query = supabase.from(_tableEvaluations).select(columns);
    if (userId != null) query.eq('user_id', userId);
    if (mediaId != null) query.eq('media_id', mediaId);
    return query //
        .is_('removed_at', null)
        .range(0, 10)
        .withConverter(EvaluationMapper.toList);
  }

  /**
   * 평가 수를 불러와요.
   */
  @override
  Future<int> countEvaluations({
    required UserID userId,
  }) {
    const options = FetchOptions(
      count: CountOption.exact,
      head: true,
    );
    return supabase
        .from(_tableEvaluations)
        .select('id', options)
        .eq('user_id', userId)
        .is_('removed_at', null)
        .then((res) => res.count);
  }

  /**
   * (경량) 평가 정보를 불러와요.
   */
  @override
  Future<Evaluation?> fetchEvaluationSlice({
    required UserID userId,
    required MediaID mediaId,
  }) {
    const columns = '''
      id
    ''';
    return supabase
        .from(_tableEvaluations)
        .select(columns)
        .eq('user_id', userId)
        .eq('media_id', mediaId)
        .is_('removed_at', null)
        .maybeSingle()
        .withConverter(EvaluationMapper.toSingle);
  }

  /**
   * 평가 정보를 불러와요.
   */
  @override
  Future<Evaluation?> fetchEvaluation({
    required UserID userId,
    required MediaID mediaId,
  }) {
    const columns = '''
      emotion
    ''';
    return supabase
        .from(_tableEvaluations)
        .select(columns)
        .eq('user_id', userId)
        .eq('media_id', mediaId)
        .is_('removed_at', null)
        .maybeSingle()
        .withConverter(EvaluationMapper.toSingle);
  }

  /**
   * 평가를 만들어요.
   */
  @override
  Future<void> createEvaluation(
    Evaluation evaluation,
  ) {
    final entity = EvaluationMapper.toEntity(evaluation);
    return supabase //
        .from(_tableEvaluations)
        .insert(entity.toJson());
  }

  /**
   * 평가를 갱신해요.
   */
  @override
  Future<void> updateEvaluation(
    Evaluation evaluation,
  ) {
    final entity = EvaluationMapper.toEntity(evaluation);
    return supabase
        .from(_tableEvaluations)
        .update(entity.toJson())
        .eq('user_id', entity.userId)
        .eq('media_id', entity.mediaId);
  }
}
