part of '../create_collection_screen.dart';

class _CreateCollectionTitleTextField extends StatelessWidget {
  const _CreateCollectionTitleTextField();

  @override
  Widget build(BuildContext context) {
    return TitleTextField(
      onChanged: (value) => {},
      value: 'title',
      hintText: 'hintText',
      autofocus: true,
    );
  }
}
