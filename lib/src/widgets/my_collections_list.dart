import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/src/configs/configs.dart';

class SliverMyCollectionsList extends StatelessWidget {
  const SliverMyCollectionsList({
    required this.childCount,
    required this.builder,
    super.key,
  });

  final int childCount;
  final NullableIndexedWidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: childCount + 1,
        (context, index) {
          // 직접 테마를 만들 수 있도록 도와요.
          if (childCount <= index) {
            return const _CreateCollectionTile();
          }

          return builder(context, index);
        },
      ),
    );
  }
}

class _CreateCollectionTile extends StatelessWidget {
  const _CreateCollectionTile();

  final double _imageSize = 56.0;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleTextStyle: context.textTheme.bodyMedium,
      onTap: () => context.pushNamed(AppRoutes.createCollectionName),
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
