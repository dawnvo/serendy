part of '../media_screen.dart';

class _MediaReactionsTile extends StatelessWidget {
  const _MediaReactionsTile({required this.reactions});

  final List<MediaReaction?> reactions;

  void _handleShowBottomSheet(BuildContext context) {
    ReactionDetailSheet.show(context, reactions);
  }

  @override
  Widget build(BuildContext context) {
    if (reactions.isNotEmpty) {
      final emotions = reactions.map((_) => _!.emotion).toList();
      final totalCount = reactions.fold<int>(0, (a, i) => a + i!.count);

      return ListTile(
        onTap: () => _handleShowBottomSheet(context),
        leading: __ReactionIcons(emotions: emotions),
        title: Text('$totalCount명이 감상했어요'),
        trailing: Icon(
          RemixIcon.arrow_right_s_line,
          color: context.colorScheme.outlineVariant,
        ),
      );
    } else {
      return _buildEmptyReactionTile(context);
    }
  }

  Widget _buildEmptyReactionTile(BuildContext context) {
    return ListTile(
      onTap: () => _handleShowBottomSheet(context),
      leading: Icon(
        RemixIcon.emotion_normal_line,
        size: Sizes.p28,
        color: context.colorScheme.outline,
      ),
      title: Text(
        '감상한 사람이 없어요',
        style: context.textTheme.bodyLarge?.copyWith(
          color: context.colorScheme.onSurfaceVariant,
        ),
      ),
      trailing: Icon(
        RemixIcon.arrow_right_s_line,
        color: context.colorScheme.outlineVariant,
      ),
    );
  }
}

//reaction-icons
class __ReactionIcons extends StatelessWidget {
  const __ReactionIcons({required this.emotions});

  final List<Emotion> emotions;

  @override
  Widget build(BuildContext context) {
    final displayEmotions =
        emotions.take(2).map((emotion) => _buildIcon(context, emotion)).toList();

    return Wrap(
      // * 가장 많이 받은 감정을 위에 두어요. (편법)
      textDirection: TextDirection.rtl,
      spacing: -12,
      children: displayEmotions.reversed.toList(),
    );
  }

  Widget _buildIcon(BuildContext context, Emotion emotion) {
    const double borderWidth = 2.0;

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: borderWidth,
          color: context.colorScheme.surface,
        ),
      ),
      child: SvgPicture.asset(
        emotion.filePath,
        height: Sizes.p28 - borderWidth,
      ),
    );
  }
}
