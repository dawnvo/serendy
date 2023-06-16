part of 'package:serendy/presentation/edit_collection/edit_collection_screen.dart';

class _EditCollectionPrivacyStatusTile extends StatelessWidget {
  const _EditCollectionPrivacyStatusTile();

  @override
  Widget build(BuildContext context) {
    final privacyStatus = context.select<EditCollectionBloc, bool>(
      (bloc) => bloc.state.privacyStatus,
    );

    return SwitchListTile(
      onChanged: (status) => context
          .read<EditCollectionBloc>()
          .add(EditCollectionPrivacyStatusChanged(status)),
      value: privacyStatus,
      title: const Text("나만 보기"),
    );
  }
}
