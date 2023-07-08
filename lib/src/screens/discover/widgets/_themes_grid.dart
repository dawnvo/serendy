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
          error: (err, stack) => SliverToBoxAdapter(
            child: Center(child: Text(err.toString())),
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
