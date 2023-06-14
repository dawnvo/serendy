part of 'package:serendy/presentation/edit_collection/edit_collection_screen.dart';

class _EditCollectionPrivacyStatusTile extends StatelessWidget {
  const _EditCollectionPrivacyStatusTile();

  @override
  Widget build(BuildContext context) {
    const privacyStatus = true;

    return SwitchListTile(
      onChanged: (status) {},
      value: privacyStatus,
      title: const Text("나만 보기"),
    );
  }
}
