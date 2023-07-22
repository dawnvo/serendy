import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/sheets/sheets.dart';
import 'package:serendy/src/widgets/widgets.dart';

class SaveMediaMenuItem extends StatelessWidget {
  const SaveMediaMenuItem({required this.media});
  final Media media;

  void handleTap(BuildContext context) {
    context.pop();
    SaveMediaSheet.show(context, media);
  }

  @override
  Widget build(BuildContext context) {
    return MenuListTile(
      onTap: () => handleTap(context),
      icon: const Icon(RemixIcon.add_box_fill),
      title: "테마에 추가하기",
    );
  }
}
