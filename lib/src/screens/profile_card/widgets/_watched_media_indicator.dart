part of '../profile_card_modal.dart';

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
    return MultiLineProgressIndicator(
      height: Sizes.p4,
      [
        // * 최대 레벨이 아닐 경우 수치를 계산해요.
        if (max != 0)
          ProgressBar(
            value: (count - min) / (max - min),
            color: color,
          )
        // * 최대 레벨일 경우 한계를 없애요.
        else
          ProgressBar(
            value: count.toDouble(),
            color: color,
          )
      ],
    );
  }
}
