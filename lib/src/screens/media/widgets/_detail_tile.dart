part of '../media_screen.dart';

class _MediaDetailsTile extends StatelessWidget {
  const _MediaDetailsTile({required this.media});

  final Media media;

  void _handleShowBottomSheet(BuildContext context) {
    context.showCustomBottomSheet((_) => _MediaDetailSheet(media));
  }

  @override
  Widget build(BuildContext context) {
    if (media.youtubeId.isNotEmpty) {
      return ListTile(
        onTap: () => _handleShowBottomSheet(context),
        leading: SvgPicture.asset(
          Assets.youtubeIcon,
          height: Sizes.p28,
        ),
        title: const Text("트레일러 보기"),
        trailing: Icon(
          RemixIcon.arrow_right_s_line,
          color: context.colorScheme.outlineVariant,
        ),
      );
    } else {
      return _buildEmptyDetailTile(context);
    }
  }

  Widget _buildEmptyDetailTile(BuildContext context) {
    return ListTile(
      onTap: () => _handleShowBottomSheet(context),
      leading: const Icon(
        RemixIcon.information_line,
        size: Sizes.p28,
      ),
      title: Text(
        "정보가 부족해요",
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
