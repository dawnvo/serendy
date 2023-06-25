import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/collection/collection.dart';
import 'package:serendy/src/presentation/@widgets/widgets.dart';

import 'controller/edit_collection_controller.dart';

part 'widgets/_image_picker.dart';
part 'widgets/_privacy_status_tile.dart';
part 'widgets/_remove_tile.dart';
part 'widgets/_save_button.dart';
part 'widgets/_title_text_field.dart';

class EditCollectionScreen extends ConsumerWidget {
  static const String routeName = 'edit-collection';
  static const String routeLocation = '/$routeName';
  const EditCollectionScreen({
    required this.collection,
    super.key,
  });

  final Collection collection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = editCollectionControllerProvider(collection);

    ref.listen(provider, (previous, next) {
      if (next.status == EditCollectionStatus.failure) {
        final errorMessage = next.errorMessage ?? '서버에 문제가 생겼어요.';
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(errorMessage)));
      }
    });

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
