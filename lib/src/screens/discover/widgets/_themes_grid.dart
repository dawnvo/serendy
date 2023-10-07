part of '../discover_screen.dart';

class _DiscoverThemesGrid extends ConsumerWidget {
  const _DiscoverThemesGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themesValue = ref.watch(getThemesProvider);

    return RefreshIndicator(
      onRefresh: () async => ref.refresh(getThemesProvider),
      child: CustomScrollView(slivers: [
        themesValue.when(
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
          error: (err, stack) => const ErrorTemplate(
            message: "테마를 불러오지 못했어요.",
            sliver: true,
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
