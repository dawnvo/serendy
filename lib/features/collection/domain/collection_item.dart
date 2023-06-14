part of 'collection.dart';

/// [Entity]
final class CollectionItem extends Equatable {
  const CollectionItem({
    required this.addedAt,
    required this.media,
  });

  /// 미디어
  final Media media;

  /// 추가한 날짜
  final DateTime addedAt;

  @override
  List<Object?> get props => [media];

  Media get convertMedia => Media(
        id: media.id,
        type: media.type,
        status: media.status,
        title: media.title,
        image: media.image,
        synopsis: media.synopsis,
        keywords: media.keywords,
        isAdult: media.isAdult,
        startDate: media.startDate,
        endDate: media.endDate,
      );
}
