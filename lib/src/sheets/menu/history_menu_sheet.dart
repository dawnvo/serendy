import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'widgets/_delete_evaluation_tile.dart';
import 'widgets/_evaluate_media_tile.dart';
import 'widgets/_save_media_tile.dart';
import 'widgets/_share_media_tile.dart';

typedef HistoryMenuSheetPayload = ({
  Evaluation evaluation,
});

class HistoryMenuSheet extends StatelessWidget {
  const HistoryMenuSheet(this.payload, {super.key});
  final HistoryMenuSheetPayload payload;

  static void show(BuildContext context, HistoryMenuSheetPayload payload) {
    context.showCustomBottomSheet((_) => HistoryMenuSheet(payload));
  }

  @override
  Widget build(BuildContext context) {
    final media = payload.evaluation.media.convertEntity;
    return MenuTemplate(
      info: MenuInfo(
        image: media.image,
        title: media.title,
      ),
      options: [
        EvaluateMediaTile(media: media),
        SaveMediaTile(media: media),
        DeleteEvaluationTile(media: media),
        ShareMediaTile(media: media),
      ],
    );
  }
}
