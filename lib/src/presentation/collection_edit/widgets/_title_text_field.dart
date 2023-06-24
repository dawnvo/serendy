part of '../edit_collection_screen.dart';

class _EditCollectionTitleTextField extends StatelessWidget {
  const _EditCollectionTitleTextField();

  @override
  Widget build(BuildContext context) {
    const title = '';

    return TitleTextField(
      onChanged: (value) {},
      value: title,
      hintText: "컬렉션 이름",
    );
  }
}
