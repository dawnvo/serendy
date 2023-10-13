part of '../discover_screen.dart';

class _DiscoverThemesGrid extends HookConsumerWidget {
  const _DiscoverThemesGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final discoverValue = ref.watch(discoverControllerProvider);
    final scrollController = useScrollController();

    // * 맨 아래로 스크롤하면 작품을 더 불러와요.
    void fetchMoreListener() {
      if (scrollController.offset >= //ReachMaxExtent
          scrollController.position.maxScrollExtent) {
        ref.read(discoverControllerProvider.notifier).fetchMore();
      }
    }

    // * Infinite scroll listener
    useEffect(() {
      scrollController.addListener(fetchMoreListener);
      return () => scrollController.removeListener(fetchMoreListener);
    }, [scrollController]);

    // * slivers
    final slivers = [
      discoverValue.when(
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
        error: (err, stack) => const ErrorTemplate(
          message: "테마를 불러오지 못했어요.",
          sliver: true,
        ),
      ),
    ];

    return RefreshIndicator(
      onRefresh: () async => ref.refresh(discoverControllerProvider),
      child: CustomScrollView(
        controller: scrollController,
        slivers: slivers,
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
