part of 'package:serendy/presentation/edit_collection/edit_collection_screen.dart';

class _EditCollectionSaveButton extends StatelessWidget {
  const _EditCollectionSaveButton();

  void handleSubmit(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    const isEdited = true;

    return TextButton(
      onPressed: isEdited ? () => handleSubmit(context) : null,
      child: const Text("저장하기"),
    );
  }
}
