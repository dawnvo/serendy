import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'controller/evaluate_media_controller.dart';

part 'widgets/_background.dart';
part 'widgets/_cover.dart';
part 'widgets/_emotion_grid.dart';

class EvaluateMediaScreen extends ConsumerWidget {
  static const String routeName = 'evaluate-media';
  static const String routeLocation = '/$routeName';
  const EvaluateMediaScreen({
    required this.media,
    super.key,
  });

  final Media media;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(evaluateMediaControllerProvider(media.id), (previous, next) {
      if (next.status == EvaluateMediaStatus.failure) {
        final errorMessage = next.errorMessage ?? '서버에 문제가 생겼어요.';
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(errorMessage)));
      }
    });

    return _EvaluateMediaTemplate(
      cover: _EvaluateMediaCover(
        image: media.image,
        title: media.title,
      ),
      background: _EvaluateMediaBackground(image: media.image),
      emotionGrid: _EvaluateMediaEmotionGrid(mediaId: media.id),
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
