part of '../admin_screen.dart';

class _AdminTypeDropdownField extends StatelessWidget {
  const _AdminTypeDropdownField();

  @override
  Widget build(BuildContext context) {
    const mediaType = MediaType.anime;

    return DropdownButton(
      onChanged: (value) {},
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
