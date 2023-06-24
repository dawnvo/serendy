part of '../edit_collection_screen.dart';

class _EditCollectionImagePicker extends StatelessWidget {
  const _EditCollectionImagePicker();

  @override
  Widget build(BuildContext context) {
    const imagePath = '';

    return ImagePicker(
      onChange: (image) {},
      image: imagePath,
    );
  }
}
