import 'package:serendy/src/configs/configs.dart';

class VerticalLinearGradient extends StatelessWidget {
  const VerticalLinearGradient({
    required this.child,
    this.stops,
    this.colors,
  });

  final Widget child;
  final List<double>? stops;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.dstOut,
      shaderCallback: (bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: stops ??
              const [
                0.5,
                1.0,
              ],
          colors: colors ??
              [
                Colors.black.withOpacity(0.64),
                Colors.black,
              ],
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
