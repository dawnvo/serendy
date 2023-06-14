part of 'package:serendy/presentation/media/media_screen.dart';

class _SaveMediaSheet extends StatelessWidget {
  const _SaveMediaSheet();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.p12),
      child: CustomScrollView(shrinkWrap: true, slivers: [
        MyCollectionsList(
          onSelect: (collection) => context.popRoute(),
        ),
      ]),
    );
  }
}
