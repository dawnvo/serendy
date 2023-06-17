part of 'package:serendy/presentation/admin/admin_screen.dart';

class _AdminAdultSwitchTile extends StatelessWidget {
  const _AdminAdultSwitchTile();

  @override
  Widget build(BuildContext context) {
    final isAdult = context.select<AddMediaCubit, bool>(
      (cubit) => cubit.state.isAdult,
    );

    return SwitchListTile(
      onChanged: (status) =>
          context.read<AddMediaCubit>().isAdultChanged(status),
      value: isAdult,
      title: const Text("19"),
    );
  }
}
