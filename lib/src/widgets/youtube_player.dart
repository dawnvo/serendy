import 'package:serendy/src/configs/configs.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart' as yp;

export 'package:youtube_player_flutter/youtube_player_flutter.dart'
    show YoutubePlayerFlags;

class YoutubePlayer extends StatefulWidget {
  const YoutubePlayer({required this.config});
  final YoutubePlayerConfig config;

  @override
  State<YoutubePlayer> createState() => _YoutubePlayerState();
}

class _YoutubePlayerState extends State<YoutubePlayer> {
  late final yp.YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = yp.YoutubePlayerController(
      initialVideoId: widget.config.videoId,
      flags: widget.config.flags,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = yp.ProgressBarColors(
      handleColor: context.colorScheme.primary,
      playedColor: context.colorScheme.primary,
    );

    return yp.YoutubePlayer(
      controller: _controller,
      bottomActions: [
        yp.ProgressBar(isExpanded: true, colors: colors),
      ],
    );
  }
}

/// YoutubePlayer config
interface class YoutubePlayerConfig extends Equatable {
  const YoutubePlayerConfig({
    required this.videoId,
    this.flags = const yp.YoutubePlayerFlags(
      loop: true,
      autoPlay: true,
      hideThumbnail: true,
      enableCaption: false,
      disableDragSeek: true,
    ),
  });

  final String videoId;
  final yp.YoutubePlayerFlags flags;

  @override
  List<Object?> get props => [
        videoId,
        flags,
      ];
}
