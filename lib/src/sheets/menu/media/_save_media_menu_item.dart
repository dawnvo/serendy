import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/widgets/widgets.dart';

import '../../../screens/media/sheets/save_media_sheet.dart';

class SaveMediaMenuItem extends StatelessWidget {
  const SaveMediaMenuItem({required this.media});
  final Media media;

  void handleTap(BuildContext context) {
    // * 메뉴를 닫아요.
    context.pop();
    // * 미디어 추가 시트를 열어요.
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
