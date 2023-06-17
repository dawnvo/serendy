part of 'package:serendy/presentation/admin/admin_screen.dart';

class _AdminImageUrlField extends StatelessWidget {
  const _AdminImageUrlField();

  @override
  Widget build(BuildContext context) {
    return _AddMediaFormField(
      onChanged: (value) => context.read<AddMediaCubit>().imageChanged(value),
      labelText: '이미지',
      hintText: "https://",
    );
  }
}
