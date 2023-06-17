import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/features/media/domain/media.dart';
import 'package:serendy/presentation/@widgets/widgets.dart';

part 'widgets/_submit_button.dart';
part 'widgets/_image_picker.dart';
part 'widgets/_title_field.dart';
part 'widgets/_keyword_field.dart';
part 'widgets/_type_dropdown_field.dart';
part 'widgets/_status_dropdown_field.dart';
part 'widgets/_adult_switch_tile.dart';
part 'widgets/_start_date_picker_field.dart';
part 'widgets/_end_date_picker_field.dart';

@RoutePage()
class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AddMediaForm();
  }
}

class _AddMediaForm extends StatelessWidget {
  const _AddMediaForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("미디어 추가")),
      body: const SingleChildScrollView(
        child: Column(children: [
          _AdminImagePicker(),
          _AdminTitleField(),
          _AdminKeywordField(),
          _AdminStartDataPickerField(),
          _AdminEndDataPickerField(),
          _AdminAdultSwitchTile(),
          Gap.h24,
          Row(children: [
            _AdminTypeDropdownField(),
            Gap.w16,
            _AdminStatusDropdownField(),
          ]),
          Gap.h40,
          _AdminSubmitButton(),
        ]),
      ),
    );
  }
}

class _AddMediaFormField extends StatelessWidget {
  const _AddMediaFormField({
    required this.value,
    required this.labelText,
    required this.hintText,
    required this.onChanged,
  });

  final String value;
  final String labelText;
  final String hintText;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: kContentPadding),
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}
