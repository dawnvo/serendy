part of '../media_screen.dart';

class SaveMediaSheet extends StatelessWidget {
  const SaveMediaSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.p12),
      child: CustomScrollView(slivers: [
        MyCollectionsList(
          onSelect: (collection) => context.popRoute(),
        ),
      ]),
    );
  }
}
