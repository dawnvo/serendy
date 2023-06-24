import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/core/_mock.dart';
import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/presentation/@widgets/widgets.dart';

part 'widgets/_background.dart';
part 'widgets/_cover.dart';
part 'widgets/_emotion_grid.dart';

class EvaluateMediaScreen extends StatelessWidget {
  static const String routeName = 'evaluate-media';
  static const String routeLocation = '/$routeName';
  const EvaluateMediaScreen({
    required this.media,
    super.key,
  });

  final Media media;

  @override
  Widget build(BuildContext context) {
    return _EvaluateMediaTemplate(
      cover: _EvaluateMediaCover(
        image: media.image,
        title: media.title,
      ),
      background: _EvaluateMediaBackground(image: media.image),
      emotionGrid: const _EvaluateMediaEmotionGrid(),
    );
  }
}

class _EvaluateMediaTemplate extends StatelessWidget {
  const _EvaluateMediaTemplate({
    required this.cover,
    required this.background,
    required this.emotionGrid,
  });

  final _EvaluateMediaCover cover;
  final _EvaluateMediaBackground background;
  final _EvaluateMediaEmotionGrid emotionGrid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Column(children: [
        Flexible(
          flex: 5,
          child: Stack(children: [
            Positioned.fill(child: background),
            Center(child: cover),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "감상 후 어떤 느낌이 들었나요?",
                style: context.textTheme.titleLarge,
              ),
            ),
          ]),
        ),
        Flexible(
          flex: 4,
          child: emotionGrid,
        ),
      ]),
    );
  }
}
