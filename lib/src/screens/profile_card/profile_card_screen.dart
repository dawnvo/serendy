import 'package:animations/animations.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/core/_mock.dart';
import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/features/user/user.dart';
import 'package:serendy/src/widgets/widgets.dart';

part 'widgets/_profile_card_titles.dart';
part 'widgets/_watched_media_indicator.dart';

class ProfileCardScreen extends StatelessWidget {
  const ProfileCardScreen({
    required this.rank,
    required this.count,
  });

  final Rank rank;
  final int count;

  static void show(BuildContext context, Rank rank, int count) {
    const transitionDuration = Duration(milliseconds: 200);
    Navigator.of(context, rootNavigator: true).push(
      PageRouteBuilder(
        fullscreenDialog: true,
        transitionDuration: transitionDuration,
        reverseTransitionDuration: transitionDuration,
        pageBuilder: (context, animation, secondaryAnimation) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.vertical,
            child: ProfileCardScreen(rank: rank, count: count),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
        count: count,
      ),
    );
  }
}

class _ProfileCardTemplate extends StatelessWidget {
  const _ProfileCardTemplate({
    required this.icon,
    required this.titles,
    required this.indicator,
  });

  final SvgPicture icon;
  final _ProfileCardTitles titles;
  final _WatchedMediaIndicator indicator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Gap.h64,
          _buildCard(context),
          Gap.h24,
          _buildCloseButton(context),
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

  Widget _buildCloseButton(BuildContext context) {
    return CloseButton(
      style: IconButton.styleFrom(
        fixedSize: const Size(56, 56),
      ),
    );
  }
}
