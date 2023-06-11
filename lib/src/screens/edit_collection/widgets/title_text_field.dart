part of '../edit_collection_screen.dart';

class _EditCollectionTitleTextField extends StatelessWidget {
  const _EditCollectionTitleTextField();

  @override
  Widget build(BuildContext context) {
    return TitleTextField(
      onChanged: (value) {},
      placeholder: "컬렉션 이름",
    );
  }
}
