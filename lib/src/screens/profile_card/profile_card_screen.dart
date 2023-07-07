import 'package:animations/animations.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/core/_mock.dart';
import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/features/user/user.dart';
import 'package:serendy/src/widgets/widgets.dart';

class ProfileCardScreen extends StatelessWidget {
  const ProfileCardScreen({super.key});

  static void show(BuildContext context) {
    showModal(
      context: context,
      builder: (context) => const ProfileCardScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const _ProfileCard(),
          Gap.h24,
          FilledButton.tonal(
            onPressed: () => context.pop(),
            child: const Text('계속하기'),
          ),
        ]),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context) {
    const rank = Rank.silver;

    return ClipRRect(
      borderRadius: BorderRadius.circular(kBorderRadius),
      child: ProfileCardContainer(
        color: rank.color.back,
        width: 280,
        height: 480,
        child: Stack(children: [
          Center(
            child: SvgPicture.asset(
              'assets/icons/serendy.svg',
              fit: BoxFit.cover,
              height: 240,
              color: rank.color.fore.withOpacity(.4),
            ),
          ),
          _buildContent(rank),
        ]),
      ),
    );
  }

  Widget _buildContent(Rank rank) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kContentPadding,
          ),
          child: __ProfileCardTitles(
            rank: rank,
            user: userMock,
          ),
        ),
        Gap.h24,
      ],
    );
  }
}

class __ProfileCardTitles extends StatelessWidget {
  const __ProfileCardTitles({
    required this.user,
    required this.rank,
  });

  final User user;
  final Rank rank;

  @override
  Widget build(BuildContext context) {
    const color = Color(0xCCFFFFFF);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap.h8,
        Text(
          user.name,
          maxLines: 1,
          overflow: TextOverflow.clip,
          style: context.textTheme.headlineMedium?.copyWith(
            color: color,
            height: 1.5,
          ),
        ),
        Text(
          "${rank.label} 등급",
          style: context.textTheme.bodyMedium?.copyWith(
            color: color,
          ),
        ),
      ],
    );
  }
}
