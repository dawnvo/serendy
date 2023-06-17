part of 'package:serendy/presentation/admin/admin_screen.dart';

class _AdminImagePicker extends StatelessWidget {
  const _AdminImagePicker();

  @override
  Widget build(BuildContext context) {
    return ImagePicker(
      onChange: (image) {},
      image: '',
    );
  }
}
