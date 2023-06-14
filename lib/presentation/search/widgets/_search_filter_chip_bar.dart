part of 'package:serendy/presentation/search/search_screen.dart';

final filtersProvider = StateProvider.autoDispose<List<String?>>((ref) => []);

class _SearchFilterChipBar extends ConsumerWidget {
  const _SearchFilterChipBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keywords = mediaMock.keywords;
    final filters = ref.watch(filtersProvider);

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
                  ref
                      .read(filtersProvider.notifier)
                      .update((state) => state.where((f) => f != k).toList());
                  return;
                }

                ref
                    .read(filtersProvider.notifier)
                    .update((state) => [...state, k]);
              },
              label: Text(k),
              visualDensity: VisualDensity.compact,
            ),
          )
      ],
    );
  }
}
