part of 'package:serendy/presentation/media/media_screen.dart';

class _MediaReactionTile extends StatelessWidget {
  const _MediaReactionTile();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MediaBloc>().state;
    List<Evaluation?> reactions = [];

    if (state is MediaLoaded) {
      reactions = state.reactions;
    }

    if (reactions.isEmpty) return _buildEmptyReactionTile(context);

    /// 중복된 감정을 병합해요.
    final uniqueKeys = reactions.map((_) => _!.emotion).toSet();
    final totalCount = reactions.length.withComma;

    return ListTile(
      onTap: () => context.showCustomModalBottomSheet(
        (context) => const _MediaReactionDetailSheet(),
      ),
      leading: _ReactionIcons(emotions: uniqueKeys.toList()),
      title: Text('$totalCount명이 감상했어요'),
      trailing: const Icon(RemixIcon.arrow_right_s_line),
    );
  }

  Widget _buildEmptyReactionTile(BuildContext context) {
    return ListTile(
      onTap: () => context.showCustomModalBottomSheet(
        (context) => const _MediaReactionDetailSheet(),
      ),
      leading: const Icon(RemixIcon.emotion_sad_line),
      title: Text(
        '아직 감상한 사람이 없어요',
        style: context.textTheme.bodyMedium?.copyWith(
          color: context.colorScheme.outline,
        ),
      ),
      trailing: const Icon(RemixIcon.arrow_right_s_line),
    );
  }
}

/// Reaction Icons
class _ReactionIcons extends StatelessWidget {
  const _ReactionIcons({required this.emotions});

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
        height: Sizes.p32 - borderWidth,
      ),
    );
  }
}
