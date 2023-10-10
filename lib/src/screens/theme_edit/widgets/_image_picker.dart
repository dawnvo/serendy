part of '../theme_edit_screen.dart';

class _EditThemeImagePicker extends ConsumerWidget {
  const _EditThemeImagePicker(this.provider);
  final EditThemeControllerProvider provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagePath = ref.watch(provider.select(
      (state) => state.image,
    ));

    return ImagePicker(
      onChanged: (image) => ref //
          .read(provider.notifier)
          .changeImage(image),
      image: imagePath,
    );
  }
}
