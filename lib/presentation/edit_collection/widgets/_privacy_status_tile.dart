part of 'package:serendy/presentation/edit_collection/edit_collection_screen.dart';

class _EditCollectionPrivacyStatusTile extends StatelessWidget {
  const _EditCollectionPrivacyStatusTile();

  @override
  Widget build(BuildContext context) {
    const privacyStatus = true;
    // .select((EditCollectionCubit cubit) => cubit.state.privacyStatus);

    return SwitchListTile(
      onChanged: (status) {
        // context.read<EditCollectionCubit>().privacyStatusChanged(status);
      },
      value: privacyStatus,
      title: const Text("나만 보기"),
    );
  }
}
