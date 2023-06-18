part of 'package:serendy/presentation/home/home_screen.dart';

class _HomeMediasGrid extends StatelessWidget {
  const _HomeMediasGrid({required this.medias});

  final List<Media?> medias;

  @override
  Widget build(BuildContext context) {
    return SliverMediasGrid(medias: medias);
  }
}
