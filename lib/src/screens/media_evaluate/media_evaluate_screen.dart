import 'dart:ui';

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
  const EvaluateMediaScreen({required this.media});

  final Media media;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(evaluateMediaControllerProvider(media.id), (previous, next) {
      // 평가에 성공한 경우
      if (next.status == EvaluateMediaStatus.success) {
        if (next.evaluation == null) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            duration: kSnackBarDisplayDurationShort,
            content: Text("감상한 작품에서 삭제했어요."),
          ));
        }
      }
      // 에러가 발생한 경우
      else if (next.status == EvaluateMediaStatus.failure) {
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

//Template
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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            constraints: const BoxConstraints(minHeight: 320),
            height: context.screenHeight / 2,
            child: Stack(children: [
              Positioned.fill(child: background),
              Center(child: cover),
            ]),
          ),
          Text(
            "감상 후 어떤 느낌이 들었나요?",
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge,
          ),
          emotionGrid,
        ]),
      ),
    );
  }
}
