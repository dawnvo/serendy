import 'package:serendy/src/configs/configs.dart';

class MultiLineProgressIndicator extends StatelessWidget {
  /// 진행 상태를 여러 줄로 표시할 수 있어요. 한 줄도 가능하고요.
  const MultiLineProgressIndicator(
    this.progressBars, {
    this.height = 10,
  });

  final List<ProgressBar?> progressBars;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(height: height),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(Sizes.p4)),
      clipBehavior: Clip.hardEdge,
      child: CustomPaint(
        painter: ProgressBarPainter(
          progressBars,
          trackColor: context.colorScheme.outline.withOpacity(0.2),
        ),
      ),
    );
  }
}

//interface
interface class ProgressBar {
  const ProgressBar({
    required this.value,
    required this.color,
  });

  final double value;
  final Color color;
}

//painter
class ProgressBarPainter extends CustomPainter {
  const ProgressBarPainter(
    this.progressBars, {
    required this.trackColor,
  });

  final List<ProgressBar?> progressBars;
  final Color trackColor;

  @override
  void paint(Canvas canvas, Size size) {
    void drawBar(double x, double width, Color color, {bool gap = false}) {
      if (width <= 0.0) return;

      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.fill;

      var left = x * size.width;
      var barWidth = width * size.width;
      if (gap) barWidth -= 2; // * 막대 길이를 줄여 틈을 만들어요.

      final rect = Offset(left, 0.0) & Size(barWidth, size.height);
      canvas.drawRect(rect, paint);
    }

    //paint-track-line
    drawBar(0.0, size.width, trackColor);

    // * 시작점(dx) 누계
    double accumulatedX = 0;
    final barCount = progressBars.length;

    for (final progressBar in progressBars) {
      if (progressBar == null) return;

      //paint-progress-bars
      drawBar(
        accumulatedX,
        progressBar.value,
        progressBar.color,
        // * 막대가 두 개 이상이고, 마지막 막대가 아니면 틈을 두어요.
        gap: barCount >= 2 && progressBar != progressBars[barCount - 1],
      );

      // * 다음 막대의 시작점을 설정해요.
      accumulatedX += progressBar.value;
    }
  }

  @override
  bool shouldRepaint(ProgressBarPainter oldDelegate) {
    return oldDelegate.progressBars.hashCode != progressBars.hashCode;
  }
}
