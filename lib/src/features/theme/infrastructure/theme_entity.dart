import 'package:json_annotation/json_annotation.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';
import 'package:serendy/src/features/theme/theme.dart';

part 'theme_entity.g.dart';

@JsonSerializable()
final class ThemeEntity {
  const ThemeEntity({
    this.id,
    this.title,
    this.image,
    this.private,
    this.description,
    this.itemsCount,
    this.ownerId,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.removedAt,
  });

  final ThemeID? id;
  final String? title;
  final String? image;
  final bool? private;
  final String? description;
  final int? itemsCount;

  //foreign
  final UserID? ownerId;
  final UserEntity? user;

  //timestamp
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? removedAt;

  factory ThemeEntity.fromJson(Json json) => _$ThemeEntityFromJson(json);
  Json toJson() => _$ThemeEntityToJson(this);
}

@JsonSerializable()
final class ThemeItemEntity {
  const ThemeItemEntity({
    this.themeId,
    this.mediaId,
    this.media,
    this.addedAt,
  });

  //foreign
  final ThemeID? themeId;
  final MediaID? mediaId;
  final MediaEntity? media;

  //timestamp
  final DateTime? addedAt;

  factory ThemeItemEntity.fromJson(Json json) => _$ThemeItemEntityFromJson(json);
  Json toJson() => _$ThemeItemEntityToJson(this);
}
