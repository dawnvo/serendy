import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/core/enums.dart';
import 'package:serendy/core/locator.dart';
import 'package:serendy/presentation/admin/cubit/add_media_cubit.dart';

part 'widgets/_adult_switch_tile.dart';
part 'widgets/_image_url_field.dart';
part 'widgets/_keyword_field.dart';
part 'widgets/_status_dropdown_field.dart';
part 'widgets/_submit_button.dart';
part 'widgets/_title_field.dart';
part 'widgets/_type_dropdown_field.dart';

@RoutePage()
class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddMediaCubit(mediaService: sl()),
      child: const _AddMediaForm(),
    );
  }
}

class _AddMediaForm extends HookWidget {
  const _AddMediaForm();

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new, const []);

    return BlocListener<AddMediaCubit, AddMediaState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(content: Text("미디어를 추가했어요.")));
        } else if (state.status.isFailure) {
          final errorMessage = state.errorMessage ?? '서버에 문제가 생겼어요.';
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(errorMessage)));
        }
      },
      child: Scaffold(
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
                  context.read<AddMediaCubit>().submitted();
                  formKey.currentState?.reset();
                }
              }),
            ]),
          ),
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
