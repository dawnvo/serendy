part of '../home_screen.dart';

class _HomeMediaFiltersBar extends HookWidget {
  const _HomeMediaFiltersBar({
    required this.filters,
    required this.onSelect,
  });

  final List<String> filters;
  final void Function(String item) onSelect;

  @override
  Widget build(BuildContext context) {
    final controller = useTabController(initialLength: filters.length);
    final selectedIndex =
        useListenableSelector(controller, () => controller.index);

    return TabBar(
      controller: controller,
      isScrollable: true,
      onTap: (index) => onSelect(filters[index]),
      tabs: [
        for (var i = 0; i < filters.length; i++)
          _MediaFilterTab(
            labelColor: selectedIndex == i
                ? context.colorScheme.onSurface
                : context.colorScheme.outline,
            label: filters[i],
          ),
      ],
    );
  }
}

class _MediaFilterTab extends StatelessWidget {
  const _MediaFilterTab({
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
