import 'package:flutter/material.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'controller/account_controller.dart';

part 'widgets/_account_controls.dart';
part 'widgets/_email_tile.dart';
part 'widgets/_image_picker.dart';
part 'widgets/_name_text_field.dart';
part 'widgets/_save_button.dart';

class AccountScreen extends ConsumerWidget {
  static const String routeName = 'account';
  static const String routeLocation = routeName;
  const AccountScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountValue = ref.watch(accountControllerProvider);

    ref.listen(accountControllerProvider, (previous, next) {
      //success
      if (previous != next && !next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("프로필을 수정했어요."),
        ));

        // TODO 프로필 관련 공급자 모두 초기화하기
      }
      //failure
      else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(next.error.toString()),
        ));
      }
    });

    return accountValue.when(
      skipLoadingOnReload: true,
      data: (state) => _AccountTemplate(
        saveButton: _AccountSaveButton(isEdited: state.isEdited),
        imagePicker: _AccountImagePicker(image: state.avatar),
        textField: _AccountNameTextField(name: state.name),
        options: [
          _AccountEmailTile(email: state.email),
          // const _AccountGenderTile(gender: '남자'),
          // const _AccountBirthTile(birth: 2000),
        ],
        controls: const _AccountControls(),
      ),
      loading: () => Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (err, stack) => Scaffold(
        body: Center(child: Text(err.toString())),
      ),
    );
  }
}

//Template
class _AccountTemplate extends StatelessWidget {
  const _AccountTemplate({
    required this.saveButton,
    required this.imagePicker,
    required this.textField,
    required this.options,
    required this.controls,
  });

  final _AccountSaveButton saveButton;
  final _AccountImagePicker imagePicker;
  final _AccountNameTextField textField;
  final _AccountControls controls;
  final List<Widget> options;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(actions: [saveButton]),
        body: SingleChildScrollView(
          child: Column(children: [
            Gap.h12,
            imagePicker,
            Gap.h12,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kContentPadding,
              ),
              child: textField,
            ),
            Gap.h24,
            ...options,
          ]),
        ),
        bottomSheet: controls,
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}

//ListTile
class _AccountListTile extends StatelessWidget {
  const _AccountListTile({
    required this.label,
    required this.value,
    required this.onTap,
  });

  final String label;
  final String? value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kContentPadding,
          vertical: Sizes.p20,
        ),
        child: Row(children: [
          //Label
          Text(label, style: context.textTheme.bodyLarge),
          Gap.w16,

          //Value
          Expanded(
            child: Text(
              value ?? '',
              textAlign: TextAlign.right,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.outline,
              ),
            ),
          ),

          Gap.w4,
          //Icon
          Icon(
            RemixIcon.arrow_right_s_line,
            color: context.colorScheme.outlineVariant,
          ),
        ]),
      ),
    );
  }
}
