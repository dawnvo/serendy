import 'package:flutter/material.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/presentation/@widgets/widgets.dart';

part 'widgets/_submit_button.dart';
part 'widgets/_title_text_field.dart';

class CreateCollectionScreen extends StatelessWidget {
  static const String routeName = 'create-collection';
  static const String routeLocation = '/$routeName';
  const CreateCollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.symmetric(horizontal: kContentPadding)
                  .add(const EdgeInsets.only(bottom: Sizes.p64)),
              child: textField,
            ),
          ],
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.all(kContentPadding),
          child: submitButton,
        ),
      ),
    );
  }
}
