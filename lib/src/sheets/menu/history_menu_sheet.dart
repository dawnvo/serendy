import 'package:flutter/material.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'widgets/_delete_evaluation_tile.dart';
import 'widgets/_evaluate_media_tile.dart';
import 'widgets/_save_media_tile.dart';
import 'widgets/_share_media_tile.dart';

class HistoryMenuSheet extends StatelessWidget {
  const HistoryMenuSheet({
    required this.evaluation,
    super.key,
  });

  final Evaluation evaluation;

  @override
  Widget build(BuildContext context) {
    final media = evaluation.media.convertEntity;
    return MenuTemplate(
      info: MenuInfo(
        image: evaluation.media.image,
        title: evaluation.media.title,
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
