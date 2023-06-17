part of 'package:serendy/presentation/admin/admin_screen.dart';

class _AdminStartDataPickerField extends StatelessWidget {
  const _AdminStartDataPickerField();

  @override
  Widget build(BuildContext context) {
    return InputDatePickerFormField(
      onDateSubmitted: (date) =>
          context.read<AddMediaCubit>().startDateChanged(date),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      fieldLabelText: "시작일",
    );
  }
}
