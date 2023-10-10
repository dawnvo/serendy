import 'dart:ui';
import 'dart:math' as math;

import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/profile/profile.dart';
import 'package:serendy/src/widgets/widgets.dart';

part 'widgets/_buttons.dart';
part 'widgets/_titles.dart';
part 'widgets/_watched_media_indicator.dart';

class ProfileCardModal extends ConsumerWidget {
  const ProfileCardModal({required this.evaluationCount});
  final int evaluationCount;

  static void show(BuildContext context, int evaluationCount) {
    showDialog(
      context: context,
      builder: (_) => ProfileCardModal(
        evaluationCount: evaluationCount,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meValue = ref.watch(getMeProvider);
    final rank = findRankByCount(evaluationCount);

    return _ProfileCardTemplate(
      icon: SvgPicture.asset(
        rank.filePath,
        fit: BoxFit.cover,
        height: 240,
      ),
      titles: _ProfileCardTitles(
        profile: meValue.value,
        rank: rank,
      ),
      indicator: _WatchedMediaIndicator(
        min: rank.range.min,
        max: rank.range.max,
        color: rank.color,
        count: evaluationCount,
      ),
      buttons: const _ProfileCardButtons(),
    );
  }
}

//Template
class _ProfileCardTemplate extends HookWidget {
  const _ProfileCardTemplate({
    required this.icon,
    required this.titles,
    required this.indicator,
    required this.buttons,
  });

  final SvgPicture icon;
  final _ProfileCardTitles titles;
  final _WatchedMediaIndicator indicator;
  final _ProfileCardButtons buttons;

  @override
  Widget build(BuildContext context) {
    final cardController = useAnimationController(
      duration: const Duration(milliseconds: 600),
    );

    useEffect(() {
      cardController.forward();
      return null;
    }, [cardController]);

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.2),
      appBar: AppBar(),
      body: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: kContentPadding,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // * 카드를 비틀어요.
                AnimatedBuilder(
                  animation: cardController,
                  child: _buildCard(context),
                  builder: (context, child) => Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(cardController.value * (math.pi / 40)),
                    alignment: FractionalOffset.center,
                    child: GestureDetector(
                      onPanUpdate: (details) {
                        // * 카드 인터렉션
                        const dragSensitivity = 120; // 클수록 민감도가 낮아져요.
                        cardController.value -= details.delta.dx / dragSensitivity;
                      },
                      onPanEnd: (details) {
                        // * 카드 인터렉션 초기화
                        cardController.value = 1.0;
                      },
                      child: child,
                    ),
                  ),
                ),
                Gap.h24,
                buttons,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kBorderRadius),
      child: GlassmorphicContainer(
        width: 280,
        height: 480,
        child: Stack(children: [
          Center(child: icon),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              titles,
              Gap.h40,
              indicator,
            ],
          )
        ]),
      ),
    );
  }
}
