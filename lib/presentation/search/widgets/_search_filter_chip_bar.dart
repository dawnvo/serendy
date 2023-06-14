part of 'package:serendy/presentation/search/search_screen.dart';

class _SearchFilterChipBar extends StatelessWidget {
  const _SearchFilterChipBar();

  @override
  Widget build(BuildContext context) {
    final keywords = mediaMock.keywords;
    final filters = [];

    return ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: kContentPadding),
      children: [
        for (final k in keywords.toSet())
          Padding(
            padding: const EdgeInsets.only(right: Sizes.p8),
            child: FilterChip.elevated(
              showCheckmark: false,
              selected: filters.contains(k),
              onSelected: (_) {
                if (filters.contains(k)) {
                  // 필터 제거
                  return;
                }

                // 필터 추가
              },
              label: Text(k),
              visualDensity: VisualDensity.compact,
            ),
          )
      ],
    );
  }
}
