import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:serendy/_mock.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/features/collection/domain/collection.dart'
    show Collection;
import 'package:serendy/presentation/@widgets/widgets.dart';

class MyCollectionsList extends StatelessWidget {
  const MyCollectionsList({
    super.key,
    this.onSelect,
  });

  final void Function(Collection collection)? onSelect;

  @override
  Widget build(BuildContext context) {
    final collections = collectionsMock;

    return SliverList.builder(
      itemCount: collections.length + 1,
      itemBuilder: (context, index) {
        // 직접 테마를 만들 수 있도록 도와요.
        if (collections.length <= index) {
          return const _CreateCollectionTile();
        }

        final item = collections[index];
        return CollectionItem(
          collection: item,
          onTap: () => onSelect?.call(item),
        );
      },
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
      onTap: () => context.pushRoute(const CreateCollectionRoute()),
      leading: _buildImage(context),
      title: const Text('테마 만들기'),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
      width: _imageSize,
      height: _imageSize,
      child: const Icon(RemixIcon.add_line),
    );
  }
}
