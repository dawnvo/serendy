import 'package:flutter/material.dart';

class SliverMediasGrid extends StatelessWidget {
  const SliverMediasGrid({
    required this.childCount,
    required this.builder,
    super.key,
    this.addAutomaticKeepAlives = true,
  });

  final int childCount;
  final bool addAutomaticKeepAlives;
  final NullableIndexedWidgetBuilder builder;

  static const _columns = 2;
  static const _spacing = 4.0;
  static const _aspectRatio = 1 / 1.3333;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _columns,
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
