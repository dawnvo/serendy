part of 'package:serendy/presentation/admin/admin_screen.dart';

class _AdminTypeDropdownField extends StatelessWidget {
  const _AdminTypeDropdownField();

  @override
  Widget build(BuildContext context) {
    final mediaType = context.select<AddMediaCubit, MediaType>(
      (bloc) => bloc.state.mediaType,
    );

    return DropdownButton(
      onChanged: (value) => context
          .read<AddMediaCubit>()
          .typeChanged(MediaType.values.byName(value ?? mediaType.name)),
      value: mediaType.name,
      items: MediaType.values
          .map((item) => DropdownMenuItem(
                value: item.name,
                child: Text(item.name),
              ))
          .toList(),
    );
  }
}
