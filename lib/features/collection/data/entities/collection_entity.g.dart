// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionEntity _$CollectionEntityFromJson(Map<String, dynamic> json) =>
    CollectionEntity(
      id: json['id'] as String,
      owner: OwnerEntity.fromJson(json['owner'] as Map<String, dynamic>),
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
              : CollectionItemEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CollectionEntityToJson(CollectionEntity instance) =>
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

CollectionItemEntity _$CollectionItemEntityFromJson(
        Map<String, dynamic> json) =>
    CollectionItemEntity(
      addedAt:
          const TimestampConverter().fromJson(json['added_at'] as Timestamp),
      media: MediaEntity.fromJson(json['media'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CollectionItemEntityToJson(
        CollectionItemEntity instance) =>
    <String, dynamic>{
      'added_at': const TimestampConverter().toJson(instance.addedAt),
      'media': instance.media.toJson(),
    };

OwnerEntity _$OwnerEntityFromJson(Map<String, dynamic> json) => OwnerEntity(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$OwnerEntityToJson(OwnerEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
