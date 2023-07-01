part of '../profile_screen.dart';

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      centerTitle: true,
      collapseMode: CollapseMode.pin,
      background: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: 160 / 2,
            backgroundImage:
                user.avatar != null ? NetworkImage(user.avatar!) : null,
          ),
          Gap.h64,
        ],
      ),
      title: Text(
        user.name,
        maxLines: 1,
        style: context.textTheme.titleLarge,
      ),
    );
  }
}
