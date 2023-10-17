import 'package:json_annotation/json_annotation.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/profile/profile.dart';

part 'evaluation_entity.g.dart';

@JsonSerializable()
final class EvaluationEntity {
  const EvaluationEntity({
    this.id,
    this.emotionId,
    this.userId,
    this.profiles,
    this.mediaId,
    this.medias,
    this.createdAt,
    this.updatedAt,
    this.removedAt,
  });

  final EvaluationID? id;
  final int? emotionId;

  //foreign
  final UserID? userId;
  final ProfileEntity? profiles;
  final MediaID? mediaId;
  final MediaEntity? medias;

  //timestamp
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? removedAt;

  factory EvaluationEntity.fromJson(Json json) => _$EvaluationEntityFromJson(json);
  Json toJson() => _$EvaluationEntityToJson(this);
}

const Map<int, Emotion> emotionIdToEnum = {
  // id | name
  1: Emotion.joy,
  2: Emotion.nice,
  3: Emotion.happyness,
  4: Emotion.surprise,
  5: Emotion.sadness,
  6: Emotion.fear,
  7: Emotion.normal,
  8: Emotion.disgust,
  9: Emotion.anger,
};

final Map<Emotion, int> emotionEnumToId = Map.fromEntries(
  emotionIdToEnum.entries.map((entry) => MapEntry(entry.value, entry.key)),
);
