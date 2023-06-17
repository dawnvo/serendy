part of 'package:serendy/presentation/edit_collection/edit_collection_screen.dart';

class _EditCollectionTitleTextField extends StatelessWidget {
  const _EditCollectionTitleTextField();

  @override
  Widget build(BuildContext context) {
    final title = context.select<EditCollectionBloc, String>(
      (bloc) => bloc.state.title,
    );

    return TitleTextField(
      onChanged: (value) => context
          .read<EditCollectionBloc>()
          .add(EditCollection$TitleChanged(value)),
      value: title,
      hintText: "컬렉션 이름",
    );
  }
}
