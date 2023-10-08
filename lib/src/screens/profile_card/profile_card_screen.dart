import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/profile/profile.dart';
import 'package:serendy/src/widgets/widgets.dart';

part 'widgets/_buttons.dart';
part 'widgets/_titles.dart';
part 'widgets/_watched_media_indicator.dart';

class ProfileCardScreen extends HookConsumerWidget {
  static const String routeName = 'card';
  static const String routeLocation = routeName;
  const ProfileCardScreen({required this.evaluationCount});

  final int evaluationCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rank = findRankByCount(evaluationCount);
    final meValue = ref.watch(getMeProvider);

    if (meValue.isLoading) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return _ProfileCardTemplate(
      icon: SvgPicture.asset(
        rank.filePath,
        fit: BoxFit.cover,
        height: 240,
      ),
      titles: _ProfileCardTitles(
        rank: rank,
        profile: meValue.requireValue,
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
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
