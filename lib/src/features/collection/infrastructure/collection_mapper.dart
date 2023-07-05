import 'package:serendy/src/features/collection/collection.dart';
import 'package:serendy/src/features/collection/infrastructure/collection_entity.dart';
import 'package:serendy/src/features/media/infrastructure/media_entity.dart';
import 'package:serendy/src/features/media/infrastructure/media_mapper.dart';
import 'package:serendy/src/features/media/media.dart';

abstract final class CollectionMapper {
  static Collection toDomainModel(final CollectionEntity entity) {
    final CollectionOwner owner = CollectionOwner(
      id: entity.owner.id,
      name: entity.owner.name,
    );

    final List<CollectionItem?> collectionItems = entity.items.map((item) {
      return CollectionItem(
        addedAt: item!.addedAt,
        media: Media(
          id: item.media.id,
          type: item.media.type,
          status: item.media.status,
          title: item.media.title,
          image: item.media.image,
          images: mediaImagesMapper(item.media),
          synopsis: item.media.synopsis,
          keywords: item.media.keywords,
          youtubeId: item.media.youtubeId,
          isAdult: item.media.isAdult,
          startDate: item.media.startDate != null
              ? DateTime.parse(item.media.startDate!)
              : null,
          endDate: item.media.endDate != null
              ? DateTime.parse(item.media.endDate!)
              : null,
        ),
      );
    }).toList();

    return Collection(
      id: entity.id,
      owner: owner,
      title: entity.title,
      description: entity.description,
      image: entity.image,
      private: entity.private,
      items: collectionItems,
      itemCount: entity.itemCount,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      removedAt: entity.removedAt,
    );
  }

  static List<Collection> toDomainModels(
      final Iterable<CollectionEntity> entities) {
    return entities
        .map((entity) => CollectionMapper.toDomainModel(entity))
        .toList();
  }

  static CollectionEntity toDataEntity(final Collection model) {
    final OwnerEntity owner = OwnerEntity(
      id: model.owner.id,
      name: model.owner.name,
    );

    final List<CollectionItemEntity?> collectionItems = model.items.map((item) {
      return CollectionItemEntity(
        addedAt: item!.addedAt,
        media: MediaEntity(
          id: item.media.id,
          type: item.media.type,
          status: item.media.status,
          title: item.media.title,
          image: item.media.image,
          synopsis: item.media.synopsis,
          keywords: item.media.keywords,
          youtubeId: item.media.youtubeId,
          isAdult: item.media.isAdult,
          startDate: item.media.startDate?.toIso8601String(),
          endDate: item.media.endDate?.toIso8601String(),
          // 이미지는 서버에서 설정할 거예요.
          images: null,
        ),
      );
    }).toList();

    return CollectionEntity(
      id: model.id,
      owner: owner,
      title: model.title,
      description: model.description,
      image: model.image,
      private: model.private,
      items: collectionItems,
      itemCount: model.itemCount,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      removedAt: model.removedAt,
    );
  }

  static List<CollectionEntity> toDataEntities(
      final Iterable<Collection> models) {
    return models.map((model) => CollectionMapper.toDataEntity(model)).toList();
  }
}
