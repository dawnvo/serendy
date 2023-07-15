import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/widgets/widgets.dart';

import '../media/_evaluate_media_menu_item.dart';
import '../media/_hide_media_menu_item.dart';
import '../media/_save_media_menu_item.dart';
import '../media/_share_media_menu_item.dart';
import '_delete_theme_item_menu_item.dart';

class ThemeItemMenuSheet extends ConsumerWidget {
  const ThemeItemMenuSheet(this.theme, this.media);
  final Theme theme;
  final Media media;

  static void show(BuildContext context, Theme theme, Media media) {
    context.showCustomBottomSheet((_) => ThemeItemMenuSheet(theme, media));
  }

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
