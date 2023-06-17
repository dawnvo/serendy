part of 'package:serendy/presentation/admin/admin_screen.dart';

class _AdminStatusDropdownField extends StatelessWidget {
  const _AdminStatusDropdownField();

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      onChanged: (value) {},
      value: MediaStatus.finished.name,
      items: MediaStatus.values
          .map((item) => DropdownMenuItem(
                value: item.name,
                child: Text(item.name),
              ))
          .toList(),
    );
  }
}
