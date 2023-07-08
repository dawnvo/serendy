part of '../theme_screen.dart';

class _ThemeItemMenuSheet extends ConsumerWidget {
  const _ThemeItemMenuSheet(this.theme, this.media);
  final Theme theme;
  final Media media;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserId = ref.watch(requireUserIdProvider);
    final isOwner = currentUserId == theme.owner.id;

    return MenuTemplate(
      info: MenuInfo(
        image: media.image,
        title: media.title,
      ),
      options: [
        EvaluateMediaMenuItem(media: media),
        SaveMediaMenuItem(media: media),
        if (isOwner)
          DeleteThemeItemMenuItem(
            media: media,
            theme: theme,
          )
        else
          HideMediaMenuItem(media: media),
        ShareMediaMenuItem(media: media),
      ],
    );
  }
}
