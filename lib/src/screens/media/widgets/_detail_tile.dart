part of '../media_screen.dart';

class _MediaDetailsTile extends StatelessWidget {
  const _MediaDetailsTile({required this.media});

  final Media media;

  void _handleShowMediaDetailSheet(BuildContext context) {
    context.showCustomModalBottomSheet(
      (context) => _MediaDetailSheet(media: media),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _handleShowMediaDetailSheet(context),
      leading: const Icon(
        RemixIcon.information_line,
        size: Sizes.p28,
      ),
      title: const Text("자세한 정보"),
      trailing: Icon(
        RemixIcon.arrow_right_s_line,
        color: context.colorScheme.outlineVariant,
      ),
    );
  }
}
