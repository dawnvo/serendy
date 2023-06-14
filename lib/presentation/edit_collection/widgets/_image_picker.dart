part of 'package:serendy/presentation/edit_collection/edit_collection_screen.dart';

class _EditCollectionImagePicker extends ConsumerWidget {
  const _EditCollectionImagePicker(this.provider);
  final EditCollectionProvider provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagePath = ref.watch(provider.select((_) => _.image));

    return ImagePicker(
      onChange: (image) => ref.read(provider.notifier).changeImage(image),
      image: imagePath,
    );
  }
}
