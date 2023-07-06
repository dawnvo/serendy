part of '../collection_screen.dart';

class _CollectionDetailBar extends StatelessWidget {
  const _CollectionDetailBar({
    required this.collection,
    required this.owner,
    required this.isOwner,
  });

  final Collection collection;
  final User owner;
  final bool isOwner;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      _buildOwnerProfile(context),
      const Spacer(),
      _buildActionIconButton(context),
      IconButton(
        onPressed: () {},
        icon: const Icon(RemixIcon.share_forward_fill),
      ),
    ]);
  }

  Widget _buildActionIconButton(BuildContext context) {
    // * 컬렉션 주인일 경우 [편집] 아이콘을 표시해요.
    if (isOwner) {
      return IconButton(
        onPressed: () => context.pushNamed(
          AppRoutes.editCollectionName,
          extra: collection,
        ),
        icon: const Icon(RemixIcon.pencil_fill),
      );
    }
    // * 아닐 경우 [좋아요] 아이콘을 표시해요.
    return IconButton(
      onPressed: () {},
      icon: const Icon(RemixIcon.heart_fill),
    );
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
      Gap.w12,
      Text(
        owner.name,
        style: context.textTheme.bodyMedium,
      ),
    ]);
  }
}
