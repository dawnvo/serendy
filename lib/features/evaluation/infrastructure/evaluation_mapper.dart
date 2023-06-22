import 'package:serendy/features/evaluation/evaluation.dart';
import 'package:serendy/features/evaluation/infrastructure/evaluation_entity.dart';

abstract final class EvaluationMapper {
  static Evaluation toDomainModel(final EvaluationEntity entity) {
    final MediaInfo media = MediaInfo(
      id: entity.media.id,
      title: entity.media.title,
      image: entity.media.image,
    );

    return Evaluation(
      id: entity.id,
      userId: entity.userId,
      private: entity.private,
      emotion: entity.emotion,
      media: media,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      removedAt: entity.removedAt,
    );
  }

  static List<Evaluation> toDomainModels(
      final Iterable<EvaluationEntity> entities) {
    return entities
        .map((entity) => EvaluationMapper.toDomainModel(entity))
        .toList();
  }

  static EvaluationEntity toDataEntity(final Evaluation model) {
    final MediaInfoEntity media = MediaInfoEntity(
      id: model.media.id,
      title: model.media.title,
      image: model.media.image,
    );

    return EvaluationEntity(
      id: model.id,
      userId: model.userId,
      media: media,
      emotion: model.emotion,
      private: model.private,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      removedAt: model.removedAt,
    );
  }

  static List<EvaluationEntity> toDataEntities(
      final Iterable<Evaluation> models) {
    return models.map((model) => EvaluationMapper.toDataEntity(model)).toList();
  }
}
