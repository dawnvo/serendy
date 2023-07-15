import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/widgets/widgets.dart';

class ShareMediaMenuItem extends StatelessWidget {
  const ShareMediaMenuItem({required this.media});

  final Media media;

  void handleTap(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return MenuListTile(
      onTap: () => handleTap(context),
      icon: const Icon(RemixIcon.share_fill),
      title: "공유하기",
    );
  }
}
