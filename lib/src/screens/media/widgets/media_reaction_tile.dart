part of '../media_screen.dart';

final _reactionsProvider = FutureProvider.autoDispose((ref) async {
  return ref.watch(mediaDetailProvider.selectAsync((_) => _.reactions));
});

class _MediaReactionTile extends ConsumerWidget {
  const _MediaReactionTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reactionsValue = ref.watch(_reactionsProvider);

    return reactionsValue.maybeWhen(
      orElse: () => const SizedBox(),
      data: (reactions) {
        if (reactions.isEmpty) {
          return _buildTile(
            context,
            icon: const Icon(RemixIcon.emotion_sad_line),
            title: Text(
              '아직 감상한 사람이 없어요',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.outline,
              ),
            ),
          );
        }

        /// 중복된 감정을 병합해요.
        final uniqueKeys = reactions.map((_) => _!.emotion).toSet();
        final totalCount = reactions.length.withComma;

        return _buildTile(
          context,
          icon: _ReactionIcons(emotions: uniqueKeys.toList()),
          title: Text('$totalCount명이 감상했어요'),
        );
      },
    );
  }

  Widget _buildTile(BuildContext context,
      {required Widget icon, required Widget title}) {
    return ListTile(
      onTap: () => context.showCustomModalBottomSheet(
        const MediaReactionDetailSheet(),
      ),
      leading: icon,
      title: title,
      trailing: const Icon(RemixIcon.arrow_right_s_line),
    );
  }
}

// ReactionIcons
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
