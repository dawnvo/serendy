part of 'package:serendy/presentation/edit_collection/edit_collection_screen.dart';

class _EditCollectionImagePicker extends StatelessWidget {
  const _EditCollectionImagePicker();

  @override
  Widget build(BuildContext context) {
    const imagePath = '';

    return ImagePicker(
      onChange: (image) {
        // context.read<EditCollectionCubit>().imageChanged(image);
      },
      image: imagePath,
    );
  }
}
