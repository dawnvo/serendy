import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/core/enums.dart';
import 'package:serendy/core/locator.dart';
import 'package:serendy/features/evaluation/domain/models/evaluation.dart';
import 'package:serendy/features/media/media.dart';
import 'package:serendy/presentation/@blocs/blocs.dart';
import 'package:serendy/presentation/@widgets/widgets.dart';

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
    return BlocProvider(
      create: (context) => MyEvaluationBloc(
        mediaId: media.id,
        evaluationService: sl(),
      )..add(const MyEvaluation$Fetched()),
      child: _EvaluateMediaView(
        media: media,
      ),
    );
  }
}

class _EvaluateMediaView extends StatelessWidget {
  const _EvaluateMediaView({required this.media});

  final Media media;

  @override
  Widget build(BuildContext context) {
    return BlocListener<MyEvaluationBloc, MyEvaluationState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == MyEvaluationStatus.failure) {
          final errorMessage = state.errorMessage ?? '서버에 문제가 생겼어요.';
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(errorMessage)));
        }
      },
      child: _EvaluateMediaTemplate(
        cover: _EvaluateMediaCover(
          image: media.image,
          title: media.title,
        ),
        background: _EvaluateMediaBackground(image: media.image),
        emotionGrid: const _EvaluateMediaEmotionGrid(),
      ),
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
