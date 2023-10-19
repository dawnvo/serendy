part of '../library_screen.dart';

class _LibraryMyThemesList extends StatelessWidget {
  const _LibraryMyThemesList({required this.themes});

  final List<Theme?> themes;

  @override
  Widget build(BuildContext context) {
    return SliverMyThemesList(
      childCount: themes.length,
      builder: (context, index) {
        final theme = themes[index]!;
        return _buildThemeItem(context, theme);
      },
    );
  }

  Widget _buildThemeItem(BuildContext context, Theme theme) {
    return ThemeItem(
      onTap: () => context.pushNamed(
        AppRoutes.theme,
        pathParameters: {'id': theme.id},
        extra: theme,
      ),
      theme: theme,
    );
  }
}
