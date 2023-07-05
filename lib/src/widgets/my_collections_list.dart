import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/collection/collection.dart'
    show Collection;
import 'package:serendy/src/widgets/widgets.dart';

class MyCollectionsList extends StatelessWidget {
  const MyCollectionsList({
    required this.collections,
    super.key,
    this.onSelect,
  });

  final List<Collection?> collections;
  final void Function(Collection collection)? onSelect;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: collections.length + 1,
      itemBuilder: (context, index) {
        // 직접 테마를 만들 수 있도록 도와요.
        if (collections.length <= index) {
          return const _CreateCollectionTile();
        }

        final collection = collections[index]!;
        return CollectionItem(
          collection: collection,
          onTap: () => onSelect?.call(collection),
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
