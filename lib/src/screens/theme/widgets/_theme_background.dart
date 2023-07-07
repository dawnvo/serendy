part of '../theme_screen.dart';

class _ThemeBackground extends StatelessWidget {
  const _ThemeBackground({required this.image});

  final String? image;

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
            image ?? Assets.themeDefaultImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
