import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/widgets/widgets.dart';

typedef _ReactionData = ({Emotion emotion, int count});

class ReactionDetailSheet extends StatelessWidget {
  const ReactionDetailSheet(this.reactions);
  final List<Evaluation?> reactions;

  static void show(BuildContext context, List<Evaluation?> reactions) {
    context.showCustomBottomSheet((_) => ReactionDetailSheet(reactions));
  }

  ///Convert `Evaluation` to `ReactionData`
  List<_ReactionData> _convert(List<Evaluation?> reactions) {
    // * 중복된 감정을 병합해요
    final uniqueKeys = reactions.map((_) => _!.emotion).toSet();

    // * 데이터 형식에 맞게 변환해요.
    final results = uniqueKeys.map((emotion) {
      final count = reactions.where((_) => _?.emotion == emotion).length;
      return (count: count, emotion: emotion);
    }).toList();

    // 정렬: 내림차순
    return results..sort((b, a) => a.count.compareTo(b.count));
  }

  @override
  Widget build(BuildContext context) {
    final reactionDatas = _convert(reactions);
    final totalCount = reactionDatas.fold<int>(0, (a, i) => a + i.count);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kContentPadding,
        vertical: Sizes.p12,
      ),
      child: SingleChildScrollView(
        child: Column(children: [
          MultiLineProgressIndicator([
            for (final data in reactionDatas)
              ProgressBar(
                color: data.emotion.color,
                value: data.count / totalCount,
              ),
          ]),
          Gap.h8,
          for (final data in reactionDatas)
            __ReactionTile(
              color: data.emotion.color,
              name: data.emotion.label,
              count: data.count,
            ),
        ]),
      ),
    );
  }
}

// ReactionTile
class __ReactionTile extends StatelessWidget {
  const __ReactionTile({
    required this.name,
    required this.count,
    required this.color,
  });

  final String name;
  final int count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.p12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.p4),
              color: color,
            ),
            width: Sizes.p16,
            height: Sizes.p16,
          ),
          Gap.w12,
          Text(name),
          const Spacer(),
          Text('${count.withComma}명'),
        ],
      ),
    );
  }
}
