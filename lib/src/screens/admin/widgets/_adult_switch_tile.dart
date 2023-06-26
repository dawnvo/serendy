part of '../admin_screen.dart';

class _AdminAdultSwitchTile extends StatelessWidget {
  const _AdminAdultSwitchTile();

  @override
  Widget build(BuildContext context) {
    const isAdult = false;

    return SwitchListTile(
      onChanged: (status) {},
      value: isAdult,
      title: const Text("19"),
    );
  }
}
