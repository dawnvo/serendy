part of '../edit_collection_screen.dart';

class _EditCollectionSaveButton extends StatelessWidget {
  const _EditCollectionSaveButton();

  void handleSubmit(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final isEdited = ''.isEmpty;

    return TextButton(
      onPressed: isEdited ? () => handleSubmit(context) : null,
      child: const Text("저장하기"),
    );
  }
}
