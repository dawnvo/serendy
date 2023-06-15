part of 'package:serendy/presentation/account/account_screen.dart';

class _AccountImagePicker extends StatelessWidget {
  const _AccountImagePicker();

  @override
  Widget build(BuildContext context) {
    const image = null;

    return ImagePicker(
      onChange: (path) {},
      image: image,
      circle: true,
    );
  }
}
