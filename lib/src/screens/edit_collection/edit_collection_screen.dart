import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/models/models.dart';
import 'package:serendy/src/providers/providers.dart';
import 'package:serendy/src/widgets/alert_dialog.dart';
import 'package:serendy/src/widgets/image_picker.dart';
import 'package:serendy/src/widgets/title_text_field.dart';

part 'widgets/save_button.dart';
part 'widgets/image_picker.dart';
part 'widgets/title_text_field.dart';
part 'widgets/privacy_status_tile.dart';
part 'widgets/remove_tile.dart';

@RoutePage()
class EditCollectionScreen extends StatelessWidget {
  const EditCollectionScreen({
    required this.collection,
    super.key,
  });

  final Collection collection;

  @override
  Widget build(BuildContext context) {
    final provider = editCollectionProvider(collection);

    return _EditCollectionTemplate(
      saveButton: _EditCollectionSaveButton(provider),
      imagePicker: _EditCollectionImagePicker(provider),
      textField: _EditCollectionTitleTextField(provider),
      options: [
        _EditCollectionPrivacyStatusTile(provider),
        _EditCollectionRemoveTile(provider),
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
