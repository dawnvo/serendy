part of 'package:serendy/presentation/search/search_screen.dart';

class _SearchResults extends StatelessWidget {
  const _SearchResults();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return MediaItem(
          onTap: () {},
          onMoreTap: () => context.showCustomModalBottomSheet(
            (context) => const MediaMenuSheet(),
          ),
          media: mediaMock,
        );
      },
    );
  }
}
