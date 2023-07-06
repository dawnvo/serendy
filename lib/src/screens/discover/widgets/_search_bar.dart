part of '../discover_screen.dart';

class _DiscoverSearchBar extends StatelessWidget {
  const _DiscoverSearchBar();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.pushNamed(AppRoutes.searchName),
      leading: const Icon(RemixIcon.search_line),
      title: const Text("무슨 애니를 찾으시나요?"),
      titleTextStyle: context.textTheme.bodyLarge?.copyWith(
        color: context.colorScheme.onSurfaceVariant,
      ),
      tileColor: context.colorScheme.surfaceVariant,
      contentPadding: const EdgeInsets.symmetric(horizontal: kContentPadding),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(kBorderRadius)),
      ),
    );
  }
}
