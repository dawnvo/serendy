part of 'evaluation.dart';

/// [Entity]
final class MediaItem extends Equatable {
  /// 미디어 식별자
  final MediaID id;

  /// 미디어 제목
  final String title;

  /// 미디어 이미지
  final String image;

  const MediaItem({
    required this.id,
    required this.title,
    required this.image,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        image,
      ];
}
