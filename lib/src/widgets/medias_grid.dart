import 'package:serendy/src/configs/configs.dart';

class MediasGrid extends StatelessWidget {
  const MediasGrid({
    required this.childCount,
    required this.builder,
    this.addAutomaticKeepAlives = true,
  });

  final int childCount;
  final bool addAutomaticKeepAlives;
  final NullableIndexedWidgetBuilder builder;

  static const _aspectRatio = 1 / 1.3333;
  static const _spacing = 4.0;

  @override
  Widget build(BuildContext context) {
    final columns = getValueForScreenType<int>(
      context: context,
      mobile: 2,
      tablet: 4,
    );

    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        mainAxisSpacing: _spacing,
        crossAxisSpacing: _spacing,
        childAspectRatio: _aspectRatio,
      ),
      itemBuilder: builder,
      itemCount: childCount,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
    );
  }
}
