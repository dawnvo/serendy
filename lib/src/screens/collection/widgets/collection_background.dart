part of '../collection_screen.dart';

class _CollectionBackgroundImage extends StatelessWidget {
  const _CollectionBackgroundImage({required this.image});

  final String? image;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: ShaderMask(
        blendMode: BlendMode.dstOut,
        shaderCallback: (bounds) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [
              0.2,
              1.0,
            ],
            colors: [
              Colors.black.withOpacity(0.64),
              Colors.black,
            ],
          ).createShader(bounds);
        },
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(
            sigmaX: 50,
            sigmaY: 50,
          ),
          child: Image.network(
            image ?? Assets.collectionDefaultImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
