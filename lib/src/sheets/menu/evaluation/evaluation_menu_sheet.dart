import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/widgets/widgets.dart';

import '../media/_evaluate_media_menu_item.dart';
import '../media/_save_media_menu_item.dart';
import '../media/_share_media_menu_item.dart';
import '_delete_evaluation_menu_item.dart';

class EvaluationMenuSheet extends StatelessWidget {
  const EvaluationMenuSheet(this.evaluation);
  final Evaluation evaluation;

  /// 하단 시트를 열어요.
  static void show(BuildContext context, Evaluation evaluation) {
    context.showCustomBottomSheet((_) => EvaluationMenuSheet(evaluation));
  }

  @override
  Widget build(BuildContext context) {
    final media = evaluation.media.convertEntity;

    return MenuTemplate(
      info: MenuInfo(
        image: media.image,
        title: media.title,
      ),
      options: [
        EvaluateMediaMenuItem(media: media),
        SaveMediaMenuItem(media: media),
        DeleteEvaluationMenuItem(media: media),
        ShareMediaMenuItem(media: media),
      ],
    );
  }
}
