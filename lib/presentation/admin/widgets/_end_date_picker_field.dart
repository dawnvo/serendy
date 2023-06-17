part of 'package:serendy/presentation/admin/admin_screen.dart';

class _AdminEndDataPickerField extends StatelessWidget {
  const _AdminEndDataPickerField();

  @override
  Widget build(BuildContext context) {
    return InputDatePickerFormField(
      onDateSubmitted: (date) =>
          context.read<AddMediaCubit>().endDateChanged(date),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      fieldLabelText: "종료일",
    );
  }
}
