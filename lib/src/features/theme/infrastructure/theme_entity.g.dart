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
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updated_at'] as Timestamp),
      description: json['description'] as String?,
      image: json['image'] as String?,
      removedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['removed_at'], const TimestampConverter().fromJson),
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
      'created_at': const TimestampConverter().toJson(instance.createdAt),
      'updated_at': const TimestampConverter().toJson(instance.updatedAt),
      'removed_at': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.removedAt, const TimestampConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

ThemeItemEntity _$ThemeItemEntityFromJson(Map<String, dynamic> json) =>
    ThemeItemEntity(
      addedAt:
          const TimestampConverter().fromJson(json['added_at'] as Timestamp),
      media: MediaEntity.fromJson(json['media'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ThemeItemEntityToJson(ThemeItemEntity instance) =>
    <String, dynamic>{
      'added_at': const TimestampConverter().toJson(instance.addedAt),
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
