import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'widgets/_evaluate_media_tile.dart';
import 'widgets/_hide_media_tile.dart';
import 'widgets/_save_media_tile.dart';
import 'widgets/_share_media_tile.dart';

typedef MediaMenuSheetPayload = ({
  Media media,
});

class MediaMenuSheet extends StatelessWidget {
  const MediaMenuSheet(this.payload, {super.key});
  final MediaMenuSheetPayload payload;

  static void show(BuildContext context, MediaMenuSheetPayload payload) {
    context.showCustomBottomSheet((_) => MediaMenuSheet(payload));
  }

  @override
  Widget build(BuildContext context) {
    return MenuTemplate(
      info: MenuInfo(
        image: payload.media.images.smallImageUrl,
        title: payload.media.title,
      ),
      options: [
        EvaluateMediaTile(media: payload.media),
        SaveMediaTile(media: payload.media),
        HideMediaTile(media: payload.media),
        ShareMediaTile(media: payload.media),
      ],
    );
  }
}
