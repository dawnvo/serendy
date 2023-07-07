part of '../discover_screen.dart';

class _DiscoverThemesGrid extends ConsumerWidget {
  const _DiscoverThemesGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final discoverValue = ref.watch(discoverControllerProvider);

    return discoverValue.when(
      data: (state) => SliverThemesGrid(
        childCount: state.themes.length,
        builder: (context, index) {
          final theme = state.themes[index]!;
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
    );
  }

  Widget _buildThemeCard(BuildContext context, Theme theme) {
    return ThemeCard(
      onTap: () => context.pushNamed(
        AppRoutes.themeName,
        pathParameters: {'id': theme.id},
      ),
      theme: theme,
    );
  }
}
