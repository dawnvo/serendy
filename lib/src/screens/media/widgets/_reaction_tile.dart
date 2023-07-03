part of '../media_screen.dart';

class _MediaReactionsTile extends StatelessWidget {
  const _MediaReactionsTile({required this.reactions});

  final List<Evaluation?> reactions;

  void _handleShowReactionDetailSheet(BuildContext context) {
    context.showCustomModalBottomSheet(
      (context) => _ReactionDetailSheet(reactions: reactions),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (reactions.isNotEmpty) {
      /// 중복된 감정을 병합해요.
      final uniqueKeys = reactions.map((_) => _!.emotion).toSet();
      final totalCount = reactions.length.withComma;

      return ListTile(
        onTap: () => _handleShowReactionDetailSheet(context),
        leading: __ReactionIcons(emotions: uniqueKeys.toList()),
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
      onTap: () => _handleShowReactionDetailSheet(context),
      leading: const Icon(
        RemixIcon.emotion_sad_line,
        size: Sizes.p28,
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

/// Reaction Icons
class __ReactionIcons extends StatelessWidget {
  const __ReactionIcons({required this.emotions});

  final List<Emotion> emotions;

  @override
  Widget build(BuildContext context) {
    final displayEmotions = emotions
        .take(2)
        .map((emotion) => _buildIcon(context, emotion))
        .toList();

    return Wrap(
      spacing: -12,

      // 가장 많이 받은 감정을 위에 두어요. (꼼수)
      textDirection: TextDirection.rtl,
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
