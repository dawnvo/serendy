import 'package:serendy/src/configs/configs.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart' as yp;

export 'package:youtube_player_flutter/youtube_player_flutter.dart' show YoutubePlayerFlags;

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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const colors = yp.ProgressBarColors(
      handleColor: Color(0xFFFF0000),
      playedColor: Color(0xFFFF0000),
    );

    return yp.YoutubePlayerBuilder(
      player: yp.YoutubePlayer(
        controller: _controller,
        bottomActions: [
          yp.ProgressBar(isExpanded: true, colors: colors),
        ],
      ),
      builder: (context, player) => GestureDetector(
        onDoubleTapDown: (details) {
          final renderBox = context.findRenderObject() as RenderBox;

          final tapPosition = renderBox.globalToLocal(details.globalPosition);
          final halfScreenWidth = context.screenWidth / 2;

          const skipSeconds = 5;
          final currentPosition = _controller.value.position;

          // * 좌측 영역 탭한 경우 -5s
          if (tapPosition.dx < halfScreenWidth) {
            var position = currentPosition - const Duration(seconds: skipSeconds);
            position = position.isNegative ? const Duration() : position;
            _controller.seekTo(position);
          }
          // * 우측 영역 탭한 경우 +5s
          else {
            final position = currentPosition + const Duration(seconds: skipSeconds);
            _controller.seekTo(position);
          }
        },
        child: player,
      ),
    );
  }
}

//player-config
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
