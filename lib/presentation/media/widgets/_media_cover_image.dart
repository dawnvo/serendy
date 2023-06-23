part of 'package:serendy/presentation/media/media_screen.dart';

class _MediaCoverImage extends StatelessWidget {
  const _MediaCoverImage({required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return VerticalLinearGradient(
      colors: [
        Colors.transparent,
        context.colorScheme.surface,
      ],
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover,
      ),
    );
  }
}
