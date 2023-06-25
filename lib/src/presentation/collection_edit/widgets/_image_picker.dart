part of '../edit_collection_screen.dart';

class _EditCollectionImagePicker extends ConsumerWidget {
  const _EditCollectionImagePicker(this.provider);
  final EditCollectionControllerProvider provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagePath = ref.watch(provider.select((state) => state.image));

    return ImagePicker(
      onChange: (image) => ref.read(provider.notifier).changeImage(image),
      image: imagePath,
    );
  }
}
