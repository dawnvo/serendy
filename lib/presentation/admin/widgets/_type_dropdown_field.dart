part of 'package:serendy/presentation/admin/admin_screen.dart';

class _AdminTypeDropdownField extends StatelessWidget {
  const _AdminTypeDropdownField();

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      onChanged: (value) {},
      value: MediaType.anime.name,
      items: MediaType.values
          .map((item) => DropdownMenuItem(
                value: item.name,
                child: Text(item.name),
              ))
          .toList(),
    );
  }
}
