import 'package:flutter/material.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'widgets/_evaluate_media_tile.dart';
import 'widgets/_hide_media_tile.dart';
import 'widgets/_save_media_tile.dart';
import 'widgets/_share_media_tile.dart';

class MediaMenuSheet extends StatelessWidget {
  const MediaMenuSheet({
    required this.media,
    super.key,
  });

  final Media media;

  @override
  Widget build(BuildContext context) {
    return MenuTemplate(
      info: MenuInfo(
        image: media.image,
        title: media.title,
      ),
      options: [
        EvaluateMediaTile(media: media),
        SaveMediaTile(media: media),
        HideMediaTile(media: media),
        ShareMediaTile(media: media),
      ],
    );
  }
}
