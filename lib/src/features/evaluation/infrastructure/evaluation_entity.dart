import 'package:json_annotation/json_annotation.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/profile/profile.dart';

part 'evaluation_entity.g.dart';

enum EmotionEntity {
  /* 재미 */ joy(1),
  /* 멋짐 */ nice(2),
  /* 행복 */ happyness(3),
  /* 놀람 */ surprise(4),
  /* 슬픔 */ sadness(5),
  /* 공포 */ fear(6),
  /* 보통 */ normal(7),
  /* 별로 */ disgust(8),
  /* 분노 */ anger(9);

  const EmotionEntity(this.id);
  final int id;

  static Emotion toDomain(int id) {
    final name = values.firstWhere((e) => e.id == id).name;
    return Emotion.values.byName(name);
  }
}

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
