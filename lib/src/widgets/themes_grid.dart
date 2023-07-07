import 'package:serendy/src/configs/configs.dart';

class SliverThemesGrid extends StatelessWidget {
  const SliverThemesGrid({
    required this.childCount,
    required this.builder,
    super.key,
    this.addAutomaticKeepAlives = true,
  });

  final int childCount;
  final bool addAutomaticKeepAlives;
  final NullableIndexedWidgetBuilder builder;

  static const _columns = 2;
  static const _spacing = 8.0;
  static const _contentHeight = 72.0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final cardWidth =
        (screenWidth / _columns) - (kContentPadding * 2) - _spacing;

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: cardWidth + _contentHeight,
        crossAxisCount: _columns,
        mainAxisSpacing: _spacing,
        crossAxisSpacing: _spacing,
      ),
      delegate: SliverChildBuilderDelegate(
        builder,
        childCount: childCount,
        addAutomaticKeepAlives: addAutomaticKeepAlives,
      ),
    );
  }
}
