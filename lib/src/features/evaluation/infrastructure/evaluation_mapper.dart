import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';

abstract final class EvaluationMapper {
  /**
   *  Entity -> Domain
   */
  static Evaluation toDomain(final EvaluationEntity entity) {
    return Evaluation(
      media: EvaluationMedia(
        id: entity.mediaId ?? entity.media?.id ?? '',
        title: entity.media?.title ?? '',
        image: entity.media?.image ?? '',
      ),
      emotion: emotionIdToEnum[entity.emotionId] ?? Emotion.joy,
      id: entity.id ?? '',
      userId: entity.userId ?? '',
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
