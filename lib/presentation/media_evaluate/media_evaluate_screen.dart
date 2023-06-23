import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/core/enums.dart';
import 'package:serendy/core/locator.dart';
import 'package:serendy/features/evaluation/evaluation.dart';
import 'package:serendy/features/media/media.dart';
import 'package:serendy/presentation/@blocs/my_evaluation/my_evaluation_bloc.dart';

part 'widgets/_emotion_grid.dart';
part 'widgets/_media_evaluate_background.dart';
part 'widgets/_media_evaluate_cover.dart';

@RoutePage()
class MediaEvaluateScreen extends StatelessWidget {
  const MediaEvaluateScreen({
    required this.evaluation,
    required this.media,
    super.key,
  });

  final Evaluation? evaluation;
  final Media media;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyEvaluationBloc(
        mediaId: media.id,
        evaluationService: sl(),
      ),
      child: _EvaluateView(
        media: media,
        evaluation: evaluation,
      ),
    );
  }
}

class _EvaluateView extends StatelessWidget {
  const _EvaluateView({
    required this.evaluation,
    required this.media,
  });

  final Evaluation? evaluation;
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
      child: _EvaluateTemplate(
        cover: _MediaEvaluateCover(
          image: media.image,
          title: media.title,
        ),
        background: _MediaEvaluateBackground(image: media.image),
        emotionGrid: _MediaEvaluateEmotionGrid(evaluation: evaluation),
      ),
    );
  }
}

class _EvaluateTemplate extends StatelessWidget {
  const _EvaluateTemplate({
    required this.cover,
    required this.background,
    required this.emotionGrid,
  });

  final _MediaEvaluateCover cover;
  final _MediaEvaluateBackground background;
  final _MediaEvaluateEmotionGrid emotionGrid;

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
