part of 'theme.dart';

//entity
final class ThemeItem extends Equatable {
  /// 작품 식별
  final MediaID mediaId;

  /// 제목
  final String title;

  /// 이미지
  final String image;

  /// 추가한 날짜
  final DateTime addedAt;

  const ThemeItem({
    required this.mediaId,
    required this.title,
    required this.image,
    required this.addedAt,
  });

  @override
  List<Object?> get props => [mediaId];

  Media get convertEntity => Media(
        id: mediaId,
        title: title,
        image: image,
        //dummy
        type: MediaType.anime,
        status: MediaStatus.finished,
        keywords: const [],
      );
}
