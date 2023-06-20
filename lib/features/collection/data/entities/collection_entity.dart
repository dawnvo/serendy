import 'package:serendy/core/network/serializable.dart';
import 'package:serendy/features/media/data/entities/media_entity.dart';

part 'collection_entity.g.dart';

/// - type: collection
/// - name: collections
/// - key: ulid
@jsonSerializable
final class CollectionEntity {
  CollectionEntity({
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
    final List<CollectionItemEntity?>? items,
  }) : items = items ?? [];

  final String id;
  final OwnerEntity owner;
  final String title;
  final String? description;
  final String? image;
  final bool private;
  final int itemCount;
  final List<CollectionItemEntity?> items;

  @TimestampConverter()
  final DateTime createdAt;
  @TimestampConverter()
  final DateTime updatedAt;
  @TimestampConverter()
  final DateTime? removedAt;

  factory CollectionEntity.fromJson(Map<String, dynamic> json) =>
      _$CollectionEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionEntityToJson(this);
}

/// - type: sub-collection
/// - name: collection_items
/// - key: media_id
@jsonSerializable
final class CollectionItemEntity {
  const CollectionItemEntity({
    required this.addedAt,
    required this.media,
  });

  @TimestampConverter()
  final DateTime addedAt;
  final MediaEntity media;

  factory CollectionItemEntity.fromJson(Map<String, dynamic> json) =>
      _$CollectionItemEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionItemEntityToJson(this);
}

/// - type: embedded
/// - name: owner
@jsonSerializable
final class OwnerEntity {
  const OwnerEntity({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory OwnerEntity.fromJson(Map<String, dynamic> json) =>
      _$OwnerEntityFromJson(json);
  Map<String, dynamic> toJson() => _$OwnerEntityToJson(this);
}
