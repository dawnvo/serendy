import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/evaluation/infrastructure/evaluation_entity.dart';

abstract final class EvaluationMapper {
  static Evaluation toDomain(final EvaluationEntity entity) {
    return Evaluation(
      media: EvaluationMedia(
        id: entity.mediaId ?? '',
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

  static EvaluationEntity toData(final Evaluation entity) {
    return EvaluationEntity(
      id: entity.id,
      userId: entity.userId,
      mediaId: entity.media.id,
      emotion: entity.emotion,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      removedAt: entity.removedAt,
    );
  }
}
