part of '../media_screen.dart';

class _MediaDetailsTile extends StatelessWidget {
  const _MediaDetailsTile({required this.media});

  final Media media;

  void _handleShowBottomSheet(BuildContext context) {
    MediaDetailSheet.show(context, media);
  }

  @override
  Widget build(BuildContext context) {
    if (media.trailer != null) {
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
      iconColor: context.colorScheme.outline,
      textColor: context.colorScheme.outline,
      leading: const Icon(
        RemixIcon.information_line,
        size: Sizes.p28,
      ),
      title: const Text("트레일러가 없어요"),
      trailing: Icon(
        RemixIcon.arrow_right_s_line,
        color: context.colorScheme.outlineVariant,
      ),
    );
  }
}
