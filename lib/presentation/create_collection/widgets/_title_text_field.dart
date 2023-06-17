part of 'package:serendy/presentation/create_collection/create_collection_screen.dart';

class _CreateCollectionTitleTextField extends StatelessWidget {
  const _CreateCollectionTitleTextField();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CreateCollectionBloc>().state;

    return TitleTextField(
      onChanged: (value) => context
          .read<CreateCollectionBloc>()
          .add(CreateCollection$TitleChanged(title: value)),
      value: state.title,
      hintText: state.hintText,
      autofocus: true,
    );
  }
}
