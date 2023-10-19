part of '../profile_card_modal.dart';

class _ProfileCardTitles extends StatelessWidget {
  const _ProfileCardTitles({
    required this.profile,
    required this.rank,
  });

  final Profile? profile;
  final Rank rank;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (profile?.username != null)
        Text(
          profile!.username.ellipsis(),
          maxLines: 1,
          style: profile!.username.length < 8
              ? context.textTheme.headlineMedium
              : context.textTheme.headlineSmall,
        )
      else
        const LoadingIndicator(),
      Gap.h8,
      Text(
        rank.label,
        style: context.textTheme.titleMedium?.copyWith(
          color: context.colorScheme.outline,
        ),
      ),
    ]);
  }
}
