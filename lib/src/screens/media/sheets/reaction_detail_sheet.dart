import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/widgets/widgets.dart';

class ReactionDetailSheet extends StatelessWidget {
  const ReactionDetailSheet(this.reactions);
  final List<MediaReaction?> reactions;

  /// 하단 시트를 열어요.
  static void show(BuildContext context, List<MediaReaction?> reactions) {
    context.showCustomBottomSheet((_) => ReactionDetailSheet(reactions));
  }

  @override
  Widget build(BuildContext context) {
    final totalCount = reactions.fold<int>(0, (a, i) => a + i!.count);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kContentPadding,
        vertical: Sizes.p12,
      ),
      child: SingleChildScrollView(
        child: Column(children: [
          MultiLineProgressIndicator([
            for (final reaction in reactions)
              ProgressBar(
                color: reaction!.emotion.color,
                value: reaction.count / totalCount,
              ),
          ]),
          Gap.h8,
          for (final reaction in reactions)
            __ReactionTile(
              color: reaction!.emotion.color,
              name: reaction.emotion.label,
              count: reaction.count,
            ),
        ]),
      ),
    );
  }
}

//reaction-tile
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
