import 'package:serendy/configs/configs.dart';
import 'package:serendy/features/evaluation/domain/evaluation.dart';
import 'package:serendy/features/media/domain/media.dart';

abstract final class EvaluationMapper {
  static Evaluation toDomain(Fragment$EvaluationFields data) {
    final media = Media(
      id: data.media.id,
      title: data.media.title,
      image: data.media.image,

      // TODO: 서버에서 받아올지. 말지.
      type: MediaType.anime,
      status: MediaStatus.finished,
      keywords: const [],
    );

    return Evaluation(
      emotion: Emotion.values.byName(data.emotion.name),
      id: data.id,
      media: media,
      userId: data.userId,
      private: data.private,
    );
  }

  static List<Evaluation?> toDomains(List<Fragment$EvaluationFields> domains) {
    return domains.map((domain) => toDomain(domain)).toList();
  }
}
