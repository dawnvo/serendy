part of 'package:serendy/presentation/edit_collection/edit_collection_screen.dart';

class _EditCollectionSaveButton extends StatelessWidget {
  const _EditCollectionSaveButton();

  void handleSubmit(BuildContext context) {
    FocusScope.of(context).unfocus();
    // context.read<EditCollectionCubit>().submitted();
    context.popRoute();
  }

  @override
  Widget build(BuildContext context) {
    // const isEdited = true;
    // context.select((EditCollectionCubit cubit) => cubit.state.isEdited);

    return TextButton(
      // onPressed: isEdited ? () => handleSubmit(context) : null,
      onPressed: () => handleSubmit(context),
      child: const Text("저장하기"),
    );
  }
}
