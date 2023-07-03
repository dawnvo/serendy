import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart' as yt;

export 'package:youtube_player_flutter/youtube_player_flutter.dart'
    show YoutubePlayerFlags;

class YoutubePlayer extends StatelessWidget {
  const YoutubePlayer({
    required this.controller,
    super.key,
  });

  final yt.YoutubePlayerController controller;

  @override
  Widget build(BuildContext context) {
    final colors = yt.ProgressBarColors(
      handleColor: context.colorScheme.primary,
      playedColor: context.colorScheme.primary,
    );

    return yt.YoutubePlayer(
      controller: controller,
      bottomActions: [
        yt.ProgressBar(isExpanded: true, colors: colors),
      ],
    );
  }
}

/// Interface
interface class YoutubePlayerConfig {
  const YoutubePlayerConfig({
    required this.videoId,
    this.flags = const yt.YoutubePlayerFlags(
      loop: true,
      autoPlay: true,
      hideThumbnail: true,
      enableCaption: false,
      disableDragSeek: true,
    ),
  });

  final String videoId;
  final yt.YoutubePlayerFlags flags;
}

final youtubePlayerController = Provider.autoDispose
    .family<yt.YoutubePlayerController, YoutubePlayerConfig>((ref, config) {
  return yt.YoutubePlayerController(
    initialVideoId: config.videoId,
    flags: config.flags,
  );
});
