// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThemeModel _$ThemeModelFromJson(Map<String, dynamic> json) => ThemeModel(
      id: json['id'] as String,
      owner: ThemeOwnerModel.fromJson(json['owner'] as Map<String, dynamic>),
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
              : ThemeItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ThemeModelToJson(ThemeModel instance) =>
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

ThemeItemModel _$ThemeItemModelFromJson(Map<String, dynamic> json) =>
    ThemeItemModel(
      addedAt: DateTime.parse(json['added_at'] as String),
      media: MediaModel.fromJson(json['media'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ThemeItemModelToJson(ThemeItemModel instance) =>
    <String, dynamic>{
      'added_at': instance.addedAt.toIso8601String(),
      'media': instance.media.toJson(),
    };

ThemeOwnerModel _$ThemeOwnerModelFromJson(Map<String, dynamic> json) =>
    ThemeOwnerModel(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ThemeOwnerModelToJson(ThemeOwnerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
