part of '../evaluate_media_screen.dart';

class _EvaluateMediaCover extends StatelessWidget {
  const _EvaluateMediaCover({
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Gap.h40, // 이미지 위치 조정
        Image.network(
          image,
          fit: BoxFit.cover,
          width: 200,
          height: 200,
        ),
        Gap.h12,
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
