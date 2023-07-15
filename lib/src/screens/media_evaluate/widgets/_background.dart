part of '../media_evaluate_screen.dart';

class _EvaluateMediaBackground extends StatelessWidget {
  const _EvaluateMediaBackground({required this.image});

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
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
