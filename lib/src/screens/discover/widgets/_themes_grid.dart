part of '../discover_screen.dart';

class _DiscoverThemesGrid extends ConsumerWidget {
  const _DiscoverThemesGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final discoverValue = ref.watch(discoverControllerProvider);

    return discoverValue.when(
      skipLoadingOnReload: true,
      data: (state) => RefreshIndicator(
        onRefresh: () => ref.refresh(getThemesProvider(page: 0).future),
        child: ThemesGrid(
          childCount: state.themes.length,
          builder: (context, index) {
            final theme = state.themes[index]!;
            return _buildThemeCard(context, theme);
          },
        ),
      ),
      loading: () => ThemesGrid(
        childCount: 8,
        addAutomaticKeepAlives: false,
        builder: (context, index) => const Placeholder$ThemeCard(),
      ),
      error: (err, stack) => const ErrorTemplate(
        message: "테마를 불러오지 못했어요.",
      ),
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
