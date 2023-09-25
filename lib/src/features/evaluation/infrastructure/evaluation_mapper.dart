import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/evaluation/infrastructure/evaluation_model.dart';

abstract final class EvaluationMapper {
  static Evaluation toDomain(final EvaluationModel model) {
    final EvaluationMedia media = EvaluationMedia(
      id: model.media.id,
      title: model.media.title,
      image: model.media.image,
    );

    return Evaluation(
      id: model.id,
      userId: model.userId,
      private: model.private,
      emotion: model.emotion,
      media: media,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      removedAt: model.removedAt,
    );
  }

  static EvaluationModel toData(final Evaluation entity) {
    final EvaluationMediaModel media = EvaluationMediaModel(
      id: entity.media.id,
      title: entity.media.title,
      image: entity.media.image,
    );

    return EvaluationModel(
      id: entity.id,
      userId: entity.userId,
      media: media,
      emotion: entity.emotion,
      private: entity.private,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      removedAt: entity.removedAt,
    );
  }
}
