part of '../admin_screen.dart';

class _AdminImageUrlField extends StatelessWidget {
  const _AdminImageUrlField();

  @override
  Widget build(BuildContext context) {
    return _AddMediaFormField(
      onChanged: (value) {},
      labelText: '이미지',
      hintText: "https://",
    );
  }
}
