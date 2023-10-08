part of '../account_screen.dart';

class _AccountImagePicker extends ConsumerWidget {
  const _AccountImagePicker({required this.image});

  final String? image;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ImagePicker(
      onChanged: (image) => ref //
          .read(accountControllerProvider.notifier)
          .changeAvatar(image),
      image: image,
      circle: true,
    );
  }
}
