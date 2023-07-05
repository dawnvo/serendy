part of '../media_screen.dart';

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
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
