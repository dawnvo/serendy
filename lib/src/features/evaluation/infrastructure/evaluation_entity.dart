import 'package:json_annotation/json_annotation.dart';
import 'package:serendy/src/core/domain/types.dart';
import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/infrastructure/media_entity.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/domain/entities/user.dart';
import 'package:serendy/src/features/user/infrastructure/user_entity.dart';

part 'evaluation_entity.g.dart';

@JsonSerializable()
final class EvaluationEntity {
  const EvaluationEntity({
    this.id,
    this.emotion,
    this.userId,
    this.users,
    this.mediaId,
    this.medias,
    this.createdAt,
    this.updatedAt,
    this.removedAt,
  });

  final EvaluationID? id;
  final Emotion? emotion;

  //foreign
  final UserID? userId;
  final UserEntity? users;
  final MediaID? mediaId;
  final MediaEntity? medias;

  //timestamp
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? removedAt;

  factory EvaluationEntity.fromJson(Json json) => _$EvaluationEntityFromJson(json);
  Json toJson() => _$EvaluationEntityToJson(this);
}
