import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/theme/theme.dart' hide ThemeItem;
import 'package:serendy/src/widgets/widgets.dart';

import '../profile_card/profile_card_modal.dart';
import 'controller/library_controller.dart';

part 'widgets/_my_themes_list.dart';
part 'widgets/_watched_indicator.dart';

class LibraryScreen extends ConsumerWidget {
  static const String routeName = 'library';
  static const String routeLocation = '/$routeName';
  const LibraryScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final libraryValue = ref.watch(libraryControllerProvider);

    return libraryValue.when(
      skipLoadingOnReload: true,
      data: (state) => RefreshIndicator(
        onRefresh: () => ref.refresh(libraryControllerProvider.future),
        child: _LibraryTemplate(
          indicator: _LibraryWatchedIndicator(count: state.evaluationsCount),
          themesList: _LibraryMyThemesList(themes: state.themes),
        ),
      ),
      loading: () => const _Placeholder$LibraryScreen(),
      error: (err, stack) => const ErrorTemplate(
        message: "라이브러리를 불러오지 못했어요.",
      ),
    );
  }
}

//template
class _LibraryTemplate extends StatelessWidget {
  const _LibraryTemplate({
    required this.indicator,
    required this.themesList,
  });

  final _LibraryWatchedIndicator indicator;
  final _LibraryMyThemesList themesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: context.colorScheme.surface,
          surfaceTintColor: Colors.transparent,
          toolbarHeight: kTextTabBarHeight,
          pinned: true,

          //title
          title: const Text("내 라이브러리"),
          actions: [
            IconButton(
              icon: const Icon(RemixIcon.menu_3_line),
              onPressed: () => context.pushNamed(AppRoutes.settings),
            ),
          ],

          //indicator
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(
              // sum: indicator + text + padding
              10 + 20 + kContentPadding * 3,
            ),
            child: Padding(
              padding: const EdgeInsets.all(kContentPadding),
              child: indicator,
            ),
          ),
        ),

        //list
        themesList,
      ]),
    );
  }
}

//placeholder
class _Placeholder$LibraryScreen extends StatelessWidget {
  const _Placeholder$LibraryScreen();

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme.surfaceVariant;
    final decoration = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(Sizes.p4)),
      color: color,
    );
    //widgets
    final Column indicator = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 14,
          decoration: decoration,
        ),
        Gap.h12,
        Container(
          height: 16,
          width: 80,
          decoration: decoration,
        ),
      ],
    );
    final themesList = SliverMyThemesList(
      childCount: 4,
      showCreateTile: false,
      addAutomaticKeepAlives: false,
      builder: (context, index) => const Placeholder$ThemeItem(),
    );
    //template
    return Scaffold(
      body: CustomScrollView(slivers: [
        const SliverAppBar(
          toolbarHeight: kTextTabBarHeight,
          title: Text("내 라이브러리"),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(kContentPadding),
          sliver: SliverToBoxAdapter(child: indicator),
        ),
        themesList,
      ]),
    );
  }
}
