import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';

abstract final class EvaluationMapper {
  /**
   *  Entity <-> Domain
   */
  static EvaluationEntity toEntity(final Evaluation domain) {
    return EvaluationEntity(
      id: domain.id,
      userId: domain.userId,
      mediaId: domain.media.id,
      emotion: domain.emotion,
      createdAt: domain.createdAt,
      updatedAt: domain.updatedAt,
      removedAt: domain.removedAt,
    );
  }

  static Evaluation toDomain(final EvaluationEntity entity) {
    return Evaluation(
      media: EvaluationMedia(
        id: entity.mediaId ?? entity.medias?.id ?? '',
        title: entity.medias?.title ?? '',
        image: entity.medias?.image ?? '',
      ),
      id: entity.id ?? '',
      userId: entity.userId ?? '',
      emotion: entity.emotion ?? Emotion.nice,
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
