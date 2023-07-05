part of 'collection.dart';

/// [Entity]
final class CollectionItem extends Equatable {
  final Media media;

  /// 추가한 날짜
  final DateTime addedAt;

  const CollectionItem({
    required this.media,
    required this.addedAt,
  });

  @override
  List<Object?> get props => [
        media,
        addedAt,
      ];

  Media get convertMedia => Media(
        id: media.id,
        type: media.type,
        status: media.status,
        title: media.title,
        image: media.image,
        images: media.images,
        keywords: media.keywords,
        synopsis: media.synopsis,
        youtubeId: media.youtubeId,
        isAdult: media.isAdult,
        startDate: media.startDate,
        endDate: media.endDate,
      );
}
