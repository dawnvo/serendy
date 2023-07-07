import 'package:serendy/src/configs/configs.dart';

class SliverMyThemesList extends StatelessWidget {
  const SliverMyThemesList({
    required this.childCount,
    required this.builder,
    this.addAutomaticKeepAlives = true,
    this.showCreateTile = true,
  });

  final int childCount;
  final bool addAutomaticKeepAlives;
  final NullableIndexedWidgetBuilder builder;
  final bool showCreateTile;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          // 마지막에 '테마 생성' 타일을 표시해요.
          if (showCreateTile && childCount <= index) {
            return const _CreateThemeTile();
          }
          return builder(context, index);
        },
        childCount: showCreateTile ? childCount + 1 : childCount,
        addAutomaticKeepAlives: addAutomaticKeepAlives,
      ),
    );
  }
}

class _CreateThemeTile extends StatelessWidget {
  const _CreateThemeTile();

  final double _imageSize = 56.0;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleTextStyle: context.textTheme.bodyMedium,
      onTap: () => context.pushNamed(AppRoutes.createTheme),
      leading: _buildImage(context),
      title: const Text('테마 만들기'),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(Sizes.p12),
      ),
      width: _imageSize,
      height: _imageSize,
      child: const Icon(RemixIcon.add_line),
    );
  }
}
