part of 'package:serendy/presentation/media/media_screen.dart';

class _MediaKeywords extends StatelessWidget {
  const _MediaKeywords({
    required this.genres,
    required this.status,
  });

  final List<String> genres;
  final List<String> status;

  @override
  Widget build(BuildContext context) {
    // "" 그리고 "null" 값은 필터해요.
    final genresFiltered = genres.where((_) => _.isNotEmpty && _ != "null");
    final statusFiltered = status.where((_) => _.isNotEmpty && _ != "null");

    return Wrap(
      spacing: 8,
      children: [
        ...genresFiltered.take(2).map((genre) => Tag(genre)),
        ...statusFiltered.map(
            (status) => Tag(status, labelColor: context.colorScheme.primary)),
      ],
    );
  }
}
