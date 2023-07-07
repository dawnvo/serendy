part of '../profile_screen.dart';

class _ProfileMyThemesList extends StatelessWidget {
  const _ProfileMyThemesList({required this.themes});

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
        AppRoutes.themeName,
        pathParameters: {'id': theme.id},
      ),
      theme: theme,
    );
  }
}
