import 'package:serendy/src/core/infrastructure/serializable.dart';
import 'package:serendy/src/features/media/infrastructure/media_model.dart';

part 'theme_model.g.dart';

@jsonSerializable
final class ThemeModel {
  ThemeModel({
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
    final List<ThemeItemModel?>? items,
  }) : items = items ?? [];

  final String id;
  final ThemeOwnerModel owner;
  final String title;
  final String? description;
  final String? image;
  final bool private;
  final int itemCount;
  final List<ThemeItemModel?> items;

  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? removedAt;

  factory ThemeModel.fromJson(Map<String, dynamic> json) =>
      _$ThemeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ThemeModelToJson(this);
}

@jsonSerializable
final class ThemeItemModel {
  const ThemeItemModel({
    required this.addedAt,
    required this.media,
  });

  final DateTime addedAt;
  final MediaModel media;

  factory ThemeItemModel.fromJson(Map<String, dynamic> json) =>
      _$ThemeItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ThemeItemModelToJson(this);
}

@jsonSerializable
final class ThemeOwnerModel {
  const ThemeOwnerModel({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory ThemeOwnerModel.fromJson(Map<String, dynamic> json) =>
      _$ThemeOwnerModelFromJson(json);
  Map<String, dynamic> toJson() => _$ThemeOwnerModelToJson(this);
}
