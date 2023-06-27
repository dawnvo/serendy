import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/widgets/widgets.dart';

import 'controller/create_collection_controller.dart';

part 'widgets/_submit_button.dart';
part 'widgets/_title_text_field.dart';

class CreateCollectionScreen extends ConsumerWidget {
  static const String routeName = 'create-collection';
  static const String routeLocation = '/$routeName';
  const CreateCollectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(createCollectionControllerProvider, (previous, next) {
      if (next.status == CreateCollectionStatus.failure) {
        final errorMessage = next.errorMessage ?? '서버에 문제가 생겼어요.';
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(errorMessage)));
      }
    });

    return const _CreateCollectionTemplate(
      textField: _CreateCollectionTitleTextField(),
      submitButton: _CreateCollectionSubmitButton(),
    );
  }
}

class _CreateCollectionTemplate extends StatelessWidget {
  const _CreateCollectionTemplate({
    required this.textField,
    required this.submitButton,
  });

  final _CreateCollectionTitleTextField textField;
  final _CreateCollectionSubmitButton submitButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "어떤 테마를 만들까요?",
              style: context.textTheme.titleLarge?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            Gap.h12,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kContentPadding),
              child: textField,
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(kContentPadding).add(EdgeInsets.only(
            bottom: context.mediaQuery.viewInsets.bottom,
          )),
          child: submitButton,
        ),
      ),
    );
  }
}
