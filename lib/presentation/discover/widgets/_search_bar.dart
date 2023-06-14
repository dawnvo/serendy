part of 'package:serendy/presentation/discover/discover_screen.dart';

class _DiscoverSearchBar extends StatelessWidget {
  const _DiscoverSearchBar();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.pushRoute(const SearchRoute()),
      leading: const Icon(RemixIcon.search_line),
      title: const Text("무슨 애니를 찾으시나요?"),
      titleTextStyle: context.textTheme.bodyLarge?.copyWith(
        color: context.colorScheme.onSurfaceVariant,
      ),
      visualDensity: VisualDensity.compact,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: kContentPadding,
        vertical: Sizes.p4,
      ),
      tileColor: context.colorScheme.surfaceVariant,
    );
  }
}
