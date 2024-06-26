import 'dart:ui';

import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/user/user.dart';
import 'package:serendy/src/widgets/widgets.dart';

part 'widgets/_buttons.dart';
part 'widgets/_titles.dart';
part 'widgets/_watched_indicator.dart';

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
        user: meValue.value,
        rank: rank,
      ),
      indicator: _ProfileCardWatchedIndicator(
        min: rank.range.min,
        max: rank.range.max,
        color: rank.color,
        count: evaluationCount,
      ),
      buttons: const _ProfileCardButtons(),
    );
  }
}

//template
class _ProfileCardTemplate extends StatelessWidget {
  const _ProfileCardTemplate({
    required this.icon,
    required this.titles,
    required this.indicator,
    required this.buttons,
  });

  final SvgPicture icon;
  final _ProfileCardTitles titles;
  final _ProfileCardWatchedIndicator indicator;
  final _ProfileCardButtons buttons;

  @override
  Widget build(BuildContext context) {
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
                _buildCard(context),
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
    return Tilt(
      lightConfig: const LightConfig(maxIntensity: 0.4),
      shadowConfig: const ShadowConfig(disable: true),
      childLayout: ChildLayout(
        outer: [
          Positioned(
            bottom: Sizes.p48,
            child: TiltParallax(
              child: Column(children: [
                icon,
                Gap.h8,
                titles,
              ]),
            ),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kBorderRadius),
        child: GlassmorphicContainer(
          width: 280,
          height: 480,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              indicator,
            ],
          ),
        ),
      ),
    );
  }
}
