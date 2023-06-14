part of 'package:serendy/presentation/edit_collection/edit_collection_screen.dart';

class _EditCollectionTitleTextField extends StatelessWidget {
  const _EditCollectionTitleTextField();

  @override
  Widget build(BuildContext context) {
    const title = null;

    return TitleTextField(
      onChanged: (value) {},
      value: title,
      placeholder: "컬렉션 이름",
    );
  }
}
