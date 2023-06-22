part of 'package:serendy/presentation/media/media_screen.dart';

class _MediaCoverImage extends StatelessWidget {
  const _MediaCoverImage({required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.dstOut,
      shaderCallback: (bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [
            0.5,
            1.0,
          ],
          colors: [
            Colors.transparent,
            context.colorScheme.surface,
          ],
        ).createShader(bounds);
      },
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover,
      ),
    );
  }
}
