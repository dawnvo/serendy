part of '../profile_card_screen.dart';

class _ProfileCardTitles extends StatelessWidget {
  const _ProfileCardTitles({
    required this.profile,
    required this.rank,
  });

  final Profile profile;
  final Rank rank;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        profile.name,
        maxLines: 1,
        overflow: TextOverflow.clip,
        style: context.textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      Gap.h8,
      Text(
        rank.label,
        style: context.textTheme.titleMedium?.copyWith(
          color: rank.color,
        ),
      ),
    ]);
  }
}
