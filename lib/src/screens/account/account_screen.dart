import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/widgets/widgets.dart';

part 'widgets/_image_picker.dart';
part 'widgets/_list_tile.dart';
part 'widgets/_name_text_field.dart';

class AccountScreen extends ConsumerWidget {
  static const String routeName = 'account';
  static const String routeLocation = routeName;
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = FocusNode();

    return _AccountTemplate(
      saveButton: TextButton(
        onPressed: () => focusNode.unfocus(),
        child: const Text("저장하기"),
      ),
      imagePicker: const _AccountImagePicker(),
      textField: _AccountNameTextField(focusNode: focusNode),
      options: [
        _AccountListTile(
          onTap: () {},
          label: "이메일",
          value: 'email',
        ),
        _AccountListTile(
          onTap: () {},
          label: "성별",
          value: "남자",
        ),
        _AccountListTile(
          onTap: () {},
          label: "생일",
          value: "2020",
        ),
      ],
      controls: [
        TextButton(
          onPressed: () {
            ref.read(authServiceProvider).signOut();
            context.goNamed(AppRoutes.signInName);
          },
          child: const Text('로그아웃'),
        ),
        TextButton(
          onPressed: () => context.goNamed(AppRoutes.homeName),
          child: const Text('회원탈퇴'),
        ),
      ],
    );
  }
}

class _AccountTemplate extends StatelessWidget {
  const _AccountTemplate({
    required this.saveButton,
    required this.imagePicker,
    required this.textField,
    required this.options,
    required this.controls,
  });

  final TextButton saveButton;
  final _AccountImagePicker imagePicker;
  final _AccountNameTextField textField;
  final List<_AccountListTile> options;
  final List<TextButton> controls;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
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
        bottomNavigationBar: _buildControls(context),
      ),
    );
  }

  Widget _buildControls(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: context.colorScheme.onSurface.withOpacity(0.4),
          ),
        ),
      ),
      child: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: controls,
      ),
    );
  }
}
