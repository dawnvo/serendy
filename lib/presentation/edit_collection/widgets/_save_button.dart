part of 'package:serendy/presentation/edit_collection/edit_collection_screen.dart';

class _EditCollectionSaveButton extends StatelessWidget {
  const _EditCollectionSaveButton();

  void handleSubmit(BuildContext context) {
    FocusScope.of(context).unfocus();
    context.read<EditCollectionBloc>().add(const EditCollection$Submitted());
  }

  @override
  Widget build(BuildContext context) {
    final isEdited = context.select<EditCollectionBloc, bool>(
      (bloc) => bloc.state.isEdited,
    );

    return TextButton(
      onPressed: isEdited ? () => handleSubmit(context) : null,
      child: const Text("저장하기"),
    );
  }
}
