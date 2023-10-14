import 'package:json_annotation/json_annotation.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/profile/profile.dart';

part 'dislike_entity.g.dart';

@JsonSerializable()
final class DislikeEntity {
  const DislikeEntity({
    this.userId,
    this.mediaId,
    this.addedAt,
  });

  final UserID? userId;
  final MediaID? mediaId;

  //timestamp
  final DateTime? addedAt;

  factory DislikeEntity.fromJson(Json json) => _$DislikeEntityFromJson(json);
  Json toJson() => _$DislikeEntityToJson(this);
}
