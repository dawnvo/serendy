import 'package:serendy/src/core/infrastructure/serializable.dart';
import 'package:serendy/src/features/media/infrastructure/media_entity.dart';

part 'theme_entity.g.dart';

@jsonSerializable
final class ThemeEntity {
  ThemeEntity({
    required this.id,
    required this.owner,
    required this.title,
    required this.private,
    required this.itemCount,
    required this.createdAt,
    required this.updatedAt,
    this.description,
    this.image,
    this.removedAt,
    final List<ThemeItemEntity?>? items,
  }) : items = items ?? [];

  final String id;
  final ThemeOwnerEntity owner;
  final String title;
  final String? description;
  final String? image;
  final bool private;
  final int itemCount;
  final List<ThemeItemEntity?> items;

  @TimestampConverter()
  final DateTime createdAt;
  @TimestampConverter()
  final DateTime updatedAt;
  @TimestampConverter()
  final DateTime? removedAt;

  factory ThemeEntity.fromJson(Map<String, dynamic> json) =>
      _$ThemeEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ThemeEntityToJson(this);
}

@jsonSerializable
final class ThemeItemEntity {
  const ThemeItemEntity({
    required this.addedAt,
    required this.media,
  });

  @TimestampConverter()
  final DateTime addedAt;
  final MediaEntity media;

  factory ThemeItemEntity.fromJson(Map<String, dynamic> json) =>
      _$ThemeItemEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ThemeItemEntityToJson(this);
}

@jsonSerializable
final class ThemeOwnerEntity {
  const ThemeOwnerEntity({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory ThemeOwnerEntity.fromJson(Map<String, dynamic> json) =>
      _$ThemeOwnerEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ThemeOwnerEntityToJson(this);
}
