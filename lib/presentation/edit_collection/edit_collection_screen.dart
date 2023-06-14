import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/features/collection/domain/collection.dart';
import 'package:serendy/presentation/@widgets/widgets.dart';

part 'widgets/_save_button.dart';
part 'widgets/_image_picker.dart';
part 'widgets/_title_text_field.dart';
part 'widgets/_privacy_status_tile.dart';
part 'widgets/_remove_tile.dart';

@RoutePage()
class EditCollectionScreen extends StatelessWidget {
  const EditCollectionScreen({
    required this.collection,
    super.key,
  });

  final Collection collection;

  @override
  Widget build(BuildContext context) {
    return const _EditCollectionTemplate(
      saveButton: _EditCollectionSaveButton(),
      imagePicker: _EditCollectionImagePicker(),
      textField: _EditCollectionTitleTextField(),
      options: [
        _EditCollectionPrivacyStatusTile(),
        _EditCollectionRemoveTile(),
      ],
    );
  }
}

class _EditCollectionTemplate extends StatelessWidget {
  const _EditCollectionTemplate({
    required this.saveButton,
    required this.imagePicker,
    required this.textField,
    required this.options,
  });

  final _EditCollectionSaveButton saveButton;
  final _EditCollectionImagePicker imagePicker;
  final _EditCollectionTitleTextField textField;
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
      ),
    );
  }
}
