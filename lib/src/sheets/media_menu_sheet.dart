import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/sheets/menu_items/menu_items.dart';
import 'package:serendy/src/widgets/widgets.dart';

class MediaMenuSheet extends StatelessWidget {
  const MediaMenuSheet(this.media);
  final Media media;

  static void show(BuildContext context, Media media) {
    context.showCustomBottomSheet((_) => MediaMenuSheet(media));
  }

  @override
  Widget build(BuildContext context) {
    return MenuTemplate(
      info: MenuInfo(
        image: media.image,
        title: media.title,
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
