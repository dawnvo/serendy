import 'dart:ui';

import 'package:serendy/src/configs/configs.dart';

class GlassmorphicContainer extends StatelessWidget {
  const GlassmorphicContainer({
    required this.child,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.2),
                Colors.white.withOpacity(0.0),
              ],
              begin: AlignmentDirectional.topEnd,
              end: AlignmentDirectional.bottomStart,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(kBorderRadius),
            ),
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
