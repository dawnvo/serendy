import 'package:serendy/configs/configs.dart';
import 'package:serendy/features/collection/domain/collection.dart';
import 'package:serendy/features/media/domain/media.dart';

abstract final class CollectionMapper {
  static Collection toDomain(Fragment$ThemeFields data) {
    final CollectionOwner owner = CollectionOwner(
      id: data.owner.id,
      name: data.owner.name,
    );
    final Iterable<CollectionItem> items = data.items.map(
      (item) => CollectionItem(
        addedAt: item.addedAt,
        media: Media(
          id: item.id,
          title: item.title,
          image: item.image,

          // TODO: 서버에서 받아올지. 말지.
          type: MediaType.anime,
          status: MediaStatus.finished,
          keywords: const [],
        ),
      ),
    );
    return Collection(
      id: data.id,
      title: data.title,
      image: data.image,
      private: data.private,
      owner: owner,
      items: items.toList(),
      itemCount: data.total.toInt(),
    );
  }

  static List<Collection> toDomains(List<Fragment$ThemeFields> domains) {
    return domains.map((domain) => toDomain(domain)).toList();
  }
}
