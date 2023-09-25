// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThemeEntity _$ThemeEntityFromJson(Map<String, dynamic> json) => ThemeEntity(
      id: json['id'] as String,
      owner: ThemeOwnerEntity.fromJson(json['owner'] as Map<String, dynamic>),
      title: json['title'] as String,
      private: json['private'] as bool,
      itemCount: json['item_count'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      description: json['description'] as String?,
      image: json['image'] as String?,
      removedAt: json['removed_at'] == null
          ? null
          : DateTime.parse(json['removed_at'] as String),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ThemeItemEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ThemeEntityToJson(ThemeEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner.toJson(),
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'private': instance.private,
      'item_count': instance.itemCount,
      'items': instance.items.map((e) => e?.toJson()).toList(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'removed_at': instance.removedAt?.toIso8601String(),
    };

ThemeItemEntity _$ThemeItemEntityFromJson(Map<String, dynamic> json) =>
    ThemeItemEntity(
      addedAt: DateTime.parse(json['added_at'] as String),
      media: MediaEntity.fromJson(json['media'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ThemeItemEntityToJson(ThemeItemEntity instance) =>
    <String, dynamic>{
      'added_at': instance.addedAt.toIso8601String(),
      'media': instance.media.toJson(),
    };

ThemeOwnerEntity _$ThemeOwnerEntityFromJson(Map<String, dynamic> json) =>
    ThemeOwnerEntity(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ThemeOwnerEntityToJson(ThemeOwnerEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
