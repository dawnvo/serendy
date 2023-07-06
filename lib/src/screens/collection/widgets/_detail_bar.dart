part of '../collection_screen.dart';

class _CollectionDetailBar extends StatelessWidget {
  const _CollectionDetailBar({
    required this.collection,
    required this.owner,
  });

  final Collection collection;
  final User owner;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      _buildOwnerProfile(context),
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

  Widget _buildOwnerProfile(BuildContext context) {
    return Row(children: [
      if (owner.avatar != null)
        CircleAvatar(
          backgroundImage: NetworkImage(owner.avatar!),
          radius: Sizes.p12,
        )
      else
        const CircleAvatar(radius: Sizes.p12),
      const SizedBox(width: Sizes.p8),
      Text(
        owner.name,
        style: context.textTheme.bodyMedium,
      ),
    ]);
  }
}
