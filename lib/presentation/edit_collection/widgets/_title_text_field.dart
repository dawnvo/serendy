part of 'package:serendy/presentation/edit_collection/edit_collection_screen.dart';

class _EditCollectionTitleTextField extends StatelessWidget {
  const _EditCollectionTitleTextField();

  @override
  Widget build(BuildContext context) {
    const title = '';
    // context.select((EditCollectionCubit cubit) => cubit.state.title);

    return TitleTextField(
      onChanged: (value) {
        // context.read<EditCollectionCubit>().titleChanged(value);
      },
      value: title,
      hintText: "컬렉션 이름",
    );
  }
}
