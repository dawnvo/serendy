part of 'package:serendy/presentation/admin/admin_screen.dart';

class _AdminTitleField extends StatelessWidget {
  const _AdminTitleField();

  @override
  Widget build(BuildContext context) {
    return _AddMediaFormField(
      onChanged: (value) {},
      value: '',
      labelText: '제목',
      hintText: "스파이 패밀리",
    );
  }
}
