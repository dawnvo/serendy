part of '../admin_screen.dart';

class _AdminStatusDropdownField extends StatelessWidget {
  const _AdminStatusDropdownField();

  @override
  Widget build(BuildContext context) {
    const mediaStatus = MediaStatus.finished;

    return DropdownButton(
      onChanged: (value) {},
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
