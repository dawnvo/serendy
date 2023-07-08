part of '../profile_card_screen.dart';

class _WatchedMediaIndicator extends StatelessWidget {
  const _WatchedMediaIndicator({
    required this.min,
    required this.max,
    required this.count,
    required this.color,
  });

  final int min;
  final int max;
  final int count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return MultiLineProgressIndicator(height: Sizes.p4, [
      ProgressBar(
        value: (count - min) / (max - min),
        color: color,
      )
    ]);
  }
}
