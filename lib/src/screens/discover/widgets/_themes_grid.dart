part of '../discover_screen.dart';

class _DiscoverThemesGrid extends ConsumerWidget {
  const _DiscoverThemesGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final discoverValue = ref.watch(fetchThemesListProvider);

    return RefreshIndicator(
      onRefresh: () async => ref.refresh(fetchThemesListProvider),
      child: CustomScrollView(slivers: [
        discoverValue.when(
          data: (themes) => SliverThemesGrid(
            childCount: themes.length,
            builder: (context, index) {
              final theme = themes[index]!;
              return _buildThemeCard(context, theme);
            },
          ),
          loading: () => SliverThemesGrid(
            childCount: 8,
            addAutomaticKeepAlives: false,
            builder: (context, index) => const Placeholder$ThemeCard(),
          ),
          error: (err, stack) => const SliverToBoxAdapter(
            child: Center(child: Text("테마를 불러오지 못했어요.")),
          ),
        ),
      ]),
    );
  }

  Widget _buildThemeCard(BuildContext context, Theme theme) {
    return ThemeCard(
      onTap: () => context.pushNamed(
        AppRoutes.theme,
        pathParameters: {'id': theme.id},
        extra: theme,
      ),
      theme: theme,
    );
  }
}
