part of '../collection_screen.dart';

class _CollectionDetailBar extends StatelessWidget {
  const _CollectionDetailBar({required this.collection});

  final Collection collection;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Row(children: [
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 12,
        ),
        const SizedBox(width: Sizes.p8),
        Text(
          collection.owner.name,
          style: context.textTheme.bodyMedium,
        ),
      ]),
      const Spacer(),
      IconButton(
        onPressed: () => context.pushNamed(
          AppRoutes.editCollectionName,
          extra: collection,
        ),
        icon: const Icon(RemixIcon.pencil_fill),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(RemixIcon.share_forward_fill),
      ),
    ]);
  }
}
