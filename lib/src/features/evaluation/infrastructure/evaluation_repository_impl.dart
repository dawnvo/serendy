import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';

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
    int? page,
    int? perPage,
  }) {
    const columns = '''
      id,
      media_id,
      emotion_id,
      medias ( title, image )
    ''';
    final query = supabase //
        .from(_tableEvaluations)
        .select(columns)
        .is_('removed_at', null);
    //identity
    if (userId != null) query.eq('user_id', userId);
    if (mediaId != null) query.eq('media_id', mediaId);
    //pagination
    if (page != null) {
      final range = getPagination(page, perPage ?? 20);
      query.range(range.from, range.to);
    }
    //result
    return query //
        .order('updated_at')
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
      id,
      user_id,
      media_id,
      removed_at
    ''';
    // * 제거한 평가도 가져와요.
    // * 평가 유무 검증에 필요해요.
    return supabase
        .from(_tableEvaluations)
        .select(columns)
        .eq('user_id', userId)
        .eq('media_id', mediaId)
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
    const columns = '*';
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
    final entity = EvaluationEntity(
      emotionId: emotionEnumToId[evaluation.emotion],
      id: evaluation.id,
      userId: evaluation.userId,
      mediaId: evaluation.media.id,
    ).toJson();
    return supabase //
        .from(_tableEvaluations)
        .insert(entity);
  }

  /**
   * 평가를 갱신해요.
   */
  @override
  Future<void> updateEvaluation(
    Evaluation evaluation,
  ) {
    final entity = EvaluationEntity(
      emotionId: emotionEnumToId[evaluation.emotion],
      updatedAt: evaluation.updatedAt,
    ).toJson();
    // [serializable] include_if_null: false
    entity['removed_at'] = null;
    return supabase
        .from(_tableEvaluations)
        .update(entity)
        .eq('user_id', evaluation.userId)
        .eq('media_id', evaluation.media.id);
  }

  /**
   * 평가를 제거해요.
   */
  @override
  Future<void> removeEvaluation(
    Evaluation evaluation,
  ) {
    final entity = EvaluationEntity(
      removedAt: evaluation.removedAt,
    ).toJson();
    return supabase
        .from(_tableEvaluations)
        .update(entity)
        .eq('user_id', evaluation.userId)
        .eq('media_id', evaluation.media.id);
  }
}
