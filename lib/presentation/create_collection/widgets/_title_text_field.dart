part of 'package:serendy/presentation/create_collection/create_collection_screen.dart';

class _CreateCollectionTitleTextField extends StatelessWidget {
  const _CreateCollectionTitleTextField();

  @override
  Widget build(BuildContext context) {
    return TitleTextField(
      autofocus: true,
      placeholder: Assets.createCollectionPlaceholders.pickRandomly(),
    );
  }
}
