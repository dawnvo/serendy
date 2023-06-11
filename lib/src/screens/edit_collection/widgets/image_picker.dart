part of '../edit_collection_screen.dart';

final imageProvider = StateProvider<String?>((ref) => null);

class _EditCollectionImagePicker extends ConsumerWidget {
  const _EditCollectionImagePicker();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(imageProvider);

    return ImagePicker(
      onChange: (path) => ref.read(imageProvider.notifier).state = path,
      image: image,
    );
  }
}
