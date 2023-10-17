part of '../home_screen.dart';

class _HomeMediaFiltersTabBar extends HookConsumerWidget {
  const _HomeMediaFiltersTabBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeValue = ref.watch(homeControllerProvider);

    // * 탭 컨트롤러
    final controller = useTabController(
      initialLength: HomeTab.values.length,
      initialIndex: homeValue.value?.tab.index ?? 1,
    );

    // * 탭 변경을 감지하면 rebuild
    final selectedIndex = useListenableSelector(
      controller,
      () => controller.index,
    );

    return TabBar(
      controller: controller,
      isScrollable: true,
      onTap: (index) => ref //
          .read(homeControllerProvider.notifier)
          .setTab(HomeTab.values[index]),
      tabs: [
        for (var i = 0; i < HomeTab.values.length; i++)
          __MediaFilterTab(
            labelColor: selectedIndex == i //
                ? context.colorScheme.onSurface
                : context.colorScheme.outline,
            label: HomeTab.values[i].label,
          ),
      ],
    );
  }
}

class __MediaFilterTab extends StatelessWidget {
  const __MediaFilterTab({
    required this.label,
    required this.labelColor,
  });

  final String label;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: AnimatedDefaultTextStyle(
        duration: kThemeChangeDuration,
        style: context.textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.w500,
          color: labelColor,
        ),
        child: Text(label),
      ),
    );
  }
}
