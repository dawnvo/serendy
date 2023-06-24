import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/core/locator.dart';
import 'package:serendy/presentation/@blocs/authentication/authentication_bloc.dart';
import 'package:serendy/presentation/@widgets/widgets.dart';
import 'package:serendy/presentation/account/bloc/account_bloc.dart';

part 'widgets/_image_picker.dart';
part 'widgets/_name_text_field.dart';
part 'widgets/_list_tile.dart';

class AccountScreen extends StatelessWidget {
  static const String routeName = 'account';
  static const String routeLocation = routeName;
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc(
            authService: sl(),
          ),
        ),
        BlocProvider(
          create: (context) => AccountBloc(
            userService: sl(),
          )..add(const Account$Fetched()),
        ),
      ],
      child: const _AccountView(),
    );
  }
}

class _AccountView extends StatelessWidget {
  const _AccountView();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AccountBloc>().state;
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
          value: state.email,
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
            context
                .read<AuthenticationBloc>()
                .add(const Authentication$SignOutRequested());
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
