part of '../collection_screen.dart';

class _CollectionDetail extends StatelessWidget {
  const _CollectionDetail({required this.collection});

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
      IconButton(icon: const Icon(RemixIcon.pencil_fill), onPressed: () {}
          // context.pushRoute(EditCollectionRoute(collection: collection)),
          ),
      IconButton(
        icon: const Icon(RemixIcon.share_forward_fill),
        onPressed: () {},
      ),
    ]);
  }
}
