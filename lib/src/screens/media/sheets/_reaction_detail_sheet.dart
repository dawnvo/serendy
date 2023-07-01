part of '../media_screen.dart';

class _ReactionDetailSheet extends StatelessWidget {
  const _ReactionDetailSheet({required this.reactions});

  final List<Evaluation?> reactions;

  @override
  Widget build(BuildContext context) {
    final reactionDatas = _transform(reactions);
    final totalCount = reactionDatas.fold<int>(0, (a, i) => a + i.count);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kContentPadding),
      child: SingleChildScrollView(
        child: Column(children: [
          Gap.h12,
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
          Gap.h12,
        ]),
      ),
    );
  }

  /// 중복된 감정을 병합하고
  /// 정제된 감정을 데이터로 변환해요.
  List<_ReactionData> _transform(List<Evaluation?> reactions) {
    final uniqueKeys = reactions.map((_) => _!.emotion).toSet();

    final results = uniqueKeys.map((emotion) {
      final count = reactions.where((_) => _?.emotion == emotion).length;
      return _ReactionData(emotion, count);
    }).toList();

    // 정렬: 내림차순
    return results..sort((b, a) => a.count.compareTo(b.count));
  }
}

// Interface
interface class _ReactionData {
  const _ReactionData(this.emotion, this.count);
  final Emotion emotion;
  final int count;
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
