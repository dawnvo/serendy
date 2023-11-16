import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/widgets/widgets.dart';

import '_evaluate_media_menu_item.dart';
import '_hide_media_menu_item.dart';
import '_save_media_menu_item.dart';
import '_share_media_menu_item.dart';

class MediaMenuSheet extends StatelessWidget {
  const MediaMenuSheet(this.media);
  final Media media;

  /// 하단 시트를 열어요.
  static void show(BuildContext context, Media media) {
    context.showCustomBottomSheet((_) => MediaMenuSheet(media));
  }

  @override
  Widget build(BuildContext context) {
    return MenuTemplate(
      info: MenuInfo(
        title: media.title,
        image: media.thumbnail,
      ),
      options: [
        EvaluateMediaMenuItem(media: media),
        SaveMediaMenuItem(media: media),
        HideMediaMenuItem(media: media),
        ShareMediaMenuItem(media: media),
      ],
    );
  }
}
