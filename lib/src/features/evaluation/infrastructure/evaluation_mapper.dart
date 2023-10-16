import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';

abstract final class EvaluationMapper {
  /**
   *  Entity -> Domain
   */
  static Evaluation toDomain(final EvaluationEntity entity) {
    return Evaluation(
      media: EvaluationMedia(
        id: entity.mediaId ?? entity.medias?.id ?? '',
        title: entity.medias?.title ?? '',
        image: entity.medias?.image ?? '',
      ),
      id: entity.id ?? '',
      userId: entity.userId ?? '',
      emotion: EmotionEntity.toDomain(entity.emotionId ?? 1),
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      removedAt: entity.removedAt,
    );
  }

  /**
   *  Json -> Domain
   */
  static Evaluation? toSingle(dynamic data) {
    if (data == null) return null;
    final entity = EvaluationEntity.fromJson(data as Json);
    return toDomain(entity);
  }

  static List<Evaluation?> toList(dynamic data) {
    if (data == null) return [];
    final dataList = data as List<dynamic>;
    return dataList.map((item) => toSingle(item)).toList();
  }
}
