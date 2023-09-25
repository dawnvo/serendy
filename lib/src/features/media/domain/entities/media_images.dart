part of 'media.dart';

/// [ValueObject]
final class MediaImages extends Equatable {
  final String imageUrl;
  final String largeImageUrl;
  final String smallImageUrl;

  const MediaImages({
    required this.imageUrl,
    required this.largeImageUrl,
    required this.smallImageUrl,
  });

  factory MediaImages.empty() => const MediaImages(
        imageUrl: '',
        largeImageUrl: '',
        smallImageUrl: '',
      );

  @override
  List<Object?> get props => [
        imageUrl,
        largeImageUrl,
        smallImageUrl,
      ];
}
