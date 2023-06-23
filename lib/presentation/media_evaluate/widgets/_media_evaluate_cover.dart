part of 'package:serendy/presentation/media_evaluate/media_evaluate_screen.dart';

class _MediaEvaluateCover extends StatelessWidget {
  const _MediaEvaluateCover({
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
        ClipRRect(
          borderRadius: BorderRadius.circular(kBorderRadius),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.cover,
            width: 200,
            height: 200,
          ),
        ),
        Gap.h12,
        Text(
          title,
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
