import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'widgets/_delete_theme_item_tile.dart';
import 'widgets/_evaluate_media_tile.dart';
import 'widgets/_hide_media_tile.dart';
import 'widgets/_save_media_tile.dart';
import 'widgets/_share_media_tile.dart';

typedef ThemeItemMenuSheetPayload = ({
  Theme theme,
  Media media,
});

class ThemeItemMenuSheet extends ConsumerWidget {
  const ThemeItemMenuSheet(this.payload, {super.key});
  final ThemeItemMenuSheetPayload payload;

  static void show(BuildContext context, ThemeItemMenuSheetPayload payload) {
    context.showCustomBottomSheet((_) => ThemeItemMenuSheet(payload));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserId = ref.watch(requireUserIdProvider);
    final isOwner = currentUserId == payload.theme.owner.id;

    return MenuTemplate(
      info: MenuInfo(
        image: payload.media.image,
        title: payload.media.title,
      ),
      options: [
        EvaluateMediaTile(media: payload.media),
        SaveMediaTile(media: payload.media),
        if (isOwner)
          DeleteThemeItemTile(
            media: payload.media,
            theme: payload.theme,
          )
        else
          HideMediaTile(media: payload.media),
        ShareMediaTile(media: payload.media),
      ],
    );
  }
}
