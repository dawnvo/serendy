part of 'package:serendy/presentation/admin/admin_screen.dart';

class _AdminStatusDropdownField extends StatelessWidget {
  const _AdminStatusDropdownField();

  @override
  Widget build(BuildContext context) {
    final mediaStatus = context.select<AddMediaCubit, MediaStatus>(
      (bloc) => bloc.state.mediaStatus,
    );

    return DropdownButton(
      onChanged: (value) => context
          .read<AddMediaCubit>()
          .statusChanged(MediaStatus.values.byName(value ?? mediaStatus.name)),
      value: mediaStatus.name,
      items: MediaStatus.values
          .map((item) => DropdownMenuItem(
                value: item.name,
                child: Text(item.name),
              ))
          .toList(),
    );
  }
}
