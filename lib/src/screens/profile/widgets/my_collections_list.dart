part of '../profile_screen.dart';

class _MyCollectionsList extends StatelessWidget {
  const _MyCollectionsList(this.items);

  final List<Collection> items;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: items.length + 1,
      itemBuilder: (context, index) {
        // 직접 테마를 만들 수 있도록 도와요.
        if (items.length <= index) {
          return const _CreateCollectionTile();
        }

        final item = items[index];
        return CollectionItem(
          collection: item,
          onTap: () => context.pushRoute(CollectionRoute(id: "collectionId")),
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
