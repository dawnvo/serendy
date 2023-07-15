import 'package:serendy/src/configs/configs.dart';

class SliverMediasGrid extends StatelessWidget {
  const SliverMediasGrid({
    required this.childCount,
    required this.builder,
    this.addAutomaticKeepAlives = true,
  });

  final int childCount;
  final bool addAutomaticKeepAlives;
  final NullableIndexedWidgetBuilder builder;

  static const _spacing = 4.0;
  static const _aspectRatio = 1 / 1.3333;

  @override
  Widget build(BuildContext context) {
    final columns = getValueForScreenType<int>(
      context: context,
      mobile: 2,
      tablet: 4,
    );

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        mainAxisSpacing: _spacing,
        crossAxisSpacing: _spacing,
        childAspectRatio: _aspectRatio,
      ),
      delegate: SliverChildBuilderDelegate(
        builder,
        childCount: childCount,
        addAutomaticKeepAlives: addAutomaticKeepAlives,
      ),
    );
  }
}
