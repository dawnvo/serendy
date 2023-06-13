part of '../media_screen.dart';

class _MediaInfoTile extends StatelessWidget {
  const _MediaInfoTile();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: const CircleAvatar(radius: Sizes.p32 / 2),
      title: const Text("자세한 정보"),
      trailing: const Icon(RemixIcon.arrow_right_s_line),
      iconColor: context.colorScheme.outlineVariant,
    );
  }
}
