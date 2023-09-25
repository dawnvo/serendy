// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Theme _$ThemeFromJson(Map<String, dynamic> json) => Theme(
      id: json['id'] as String,
      owner: ThemeOwner.fromJson(json['owner'] as Map<String, dynamic>),
      private: json['private'] as bool,
      title: json['title'] as String,
      image: json['image'] as String?,
      description: json['description'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : ThemeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemsCount: json['itemsCount'] as int?,
    );

Map<String, dynamic> _$ThemeToJson(Theme instance) => <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'private': instance.private,
      'title': instance.title,
      'image': instance.image,
      'description': instance.description,
      'items': instance.items,
      'itemsCount': instance.itemsCount,
    };

ThemeItem _$ThemeItemFromJson(Map<String, dynamic> json) => ThemeItem(
      id: json['id'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
      addedAt: DateTime.parse(json['addedAt'] as String),
    );

Map<String, dynamic> _$ThemeItemToJson(ThemeItem instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'addedAt': instance.addedAt.toIso8601String(),
    };

ThemeOwner _$ThemeOwnerFromJson(Map<String, dynamic> json) => ThemeOwner(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ThemeOwnerToJson(ThemeOwner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
