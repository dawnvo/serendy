import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/core/enums.dart';

part 'widgets/_adult_switch_tile.dart';
part 'widgets/_image_url_field.dart';
part 'widgets/_keyword_field.dart';
part 'widgets/_status_dropdown_field.dart';
part 'widgets/_submit_button.dart';
part 'widgets/_title_field.dart';
part 'widgets/_type_dropdown_field.dart';

class AdminScreen extends StatelessWidget {
  static const String routeName = 'admin';
  static const String routeLocation = '/$routeName';
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new, const []);

    return Scaffold(
      appBar: AppBar(title: const Text("미디어 추가")),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(children: [
            const _AdminTitleField(),
            const _AdminKeywordField(),
            const _AdminImageUrlField(),
            const _AdminAdultSwitchTile(),
            Gap.h24,
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              _AdminTypeDropdownField(),
              Gap.w16,
              _AdminStatusDropdownField(),
            ]),
            Gap.h40,
            _AdminSubmitButton(onSubmit: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState?.reset();
              }
            }),
          ]),
        ),
      ),
    );
  }
}

class _AddMediaFormField extends StatelessWidget {
  const _AddMediaFormField({
    required this.labelText,
    required this.hintText,
    required this.onChanged,
  });

  final String labelText;
  final String hintText;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: kContentPadding),
        labelText: labelText,
        hintText: hintText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '입력하세요.';
        }

        return null;
      },
    );
  }
}
