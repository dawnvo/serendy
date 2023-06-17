part of 'package:serendy/presentation/admin/admin_screen.dart';

class _AdminKeywordField extends StatelessWidget {
  const _AdminKeywordField();

  @override
  Widget build(BuildContext context) {
    return _AddMediaFormField(
      onChanged: (value) {},
      value: '',
      labelText: '키워드',
      hintText: "코미디, 액션",
    );
  }
}
