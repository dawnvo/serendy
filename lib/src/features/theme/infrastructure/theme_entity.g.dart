// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThemeEntity _$ThemeEntityFromJson(Map<String, dynamic> json) => ThemeEntity(
      id: json['id'] as String?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      private: json['private'] as bool?,
      description: json['description'] as String?,
      itemsCount: json['items_count'] as int?,
      ownerId: json['owner_id'] as String?,
      user: json['user'] == null
          ? null
          : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      removedAt: json['removed_at'] == null
          ? null
          : DateTime.parse(json['removed_at'] as String),
    );

Map<String, dynamic> _$ThemeEntityToJson(ThemeEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('image', instance.image);
  writeNotNull('private', instance.private);
  writeNotNull('description', instance.description);
  writeNotNull('items_count', instance.itemsCount);
  writeNotNull('owner_id', instance.ownerId);
  writeNotNull('user', instance.user?.toJson());
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  writeNotNull('removed_at', instance.removedAt?.toIso8601String());
  return val;
}

ThemeItemEntity _$ThemeItemEntityFromJson(Map<String, dynamic> json) =>
    ThemeItemEntity(
      themeId: json['theme_id'] as String?,
      mediaId: json['media_id'] as String?,
      media: json['media'] == null
          ? null
          : MediaEntity.fromJson(json['media'] as Map<String, dynamic>),
      addedAt: json['added_at'] == null
          ? null
          : DateTime.parse(json['added_at'] as String),
    );

Map<String, dynamic> _$ThemeItemEntityToJson(ThemeItemEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('theme_id', instance.themeId);
  writeNotNull('media_id', instance.mediaId);
  writeNotNull('media', instance.media?.toJson());
  writeNotNull('added_at', instance.addedAt?.toIso8601String());
  return val;
}
