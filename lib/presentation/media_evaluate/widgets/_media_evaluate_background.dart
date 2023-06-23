part of 'package:serendy/presentation/media_evaluate/media_evaluate_screen.dart';

class _MediaEvaluateBackground extends StatelessWidget {
  const _MediaEvaluateBackground({required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: VerticalLinearGradient(
        stops: const [
          0.2,
          1.0,
        ],
        child: ImageFiltered(
          imageFilter: ImageFilter.blur(
            sigmaX: 50,
            sigmaY: 50,
          ),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
