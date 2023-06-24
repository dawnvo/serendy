part of '../account_screen.dart';

class _AccountImagePicker extends StatelessWidget {
  const _AccountImagePicker();

  @override
  Widget build(BuildContext context) {
    const imagePath = null;

    return ImagePicker(
      onChange: (path) {},
      image: imagePath,
      circle: true,
    );
  }
}
