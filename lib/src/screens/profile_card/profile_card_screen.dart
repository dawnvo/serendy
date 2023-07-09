import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/core/_mock.dart';
import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/features/user/user.dart';
import 'package:serendy/src/widgets/widgets.dart';

part 'widgets/_profile_card_buttons.dart';
part 'widgets/_profile_card_titles.dart';
part 'widgets/_watched_media_indicator.dart';

class ProfileCardScreen extends StatelessWidget {
  static const String routeName = 'card';
  static const String routeLocation = routeName;
  const ProfileCardScreen({required this.evaluationCount});

  final int evaluationCount;

  @override
  Widget build(BuildContext context) {
    final rank = findRankByCount(evaluationCount);
    return _ProfileCardTemplate(
      icon: SvgPicture.asset(
        rank.filePath,
        fit: BoxFit.cover,
        height: 240,
      ),
      titles: _ProfileCardTitles(
        rank: rank,
        user: userMock,
      ),
      indicator: _WatchedMediaIndicator(
        min: rank.range.min,
        max: rank.range.max,
        color: rank.color.fore,
        count: evaluationCount,
      ),
      buttons: const _ProfileCardButtons(),
    );
  }
}

class _ProfileCardTemplate extends StatelessWidget {
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
    return Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Gap.h64,
          _buildCard(context),
          Gap.h24,
          buttons,
        ]),
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kBorderRadius),
      child: ProfileCardContainer(
        color: Colors.black,
        width: 280,
        height: 480,
        child: Stack(children: [
          Center(child: icon),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kContentPadding,
                ),
                child: titles,
              ),
              Gap.h40,
              indicator,
            ],
          )
        ]),
      ),
    );
  }
}
