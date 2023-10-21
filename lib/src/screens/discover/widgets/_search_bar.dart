part of '../discover_screen.dart';

class _DiscoverSearchBar extends StatelessWidget {
  const _DiscoverSearchBar();

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme.outline;
    return ListTile(
      //styles
      contentPadding: const EdgeInsets.symmetric(horizontal: kContentPadding),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(kBorderRadius)),
      ),
      tileColor: context.colorScheme.surfaceVariant,
      titleTextStyle: context.textTheme.bodyLarge?.copyWith(color: color),
      iconColor: color,
      //contents
      onTap: () => context.pushNamed(AppRoutes.search),
      leading: const Icon(RemixIcon.search_line),
      title: const Text("무슨 애니를 찾으시나요?"),
    );
  }
}
