import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/theme/theme.dart';

class ThemeCard extends StatelessWidget {
  const ThemeCard({
    required this.theme,
    this.onTap,
  });

  final Theme theme;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque, // 빈 영역 터치
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(context),
          Gap.h12,
          _buildTitle(context),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kBorderRadius),
      clipBehavior: Clip.hardEdge,
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Image.network(
          theme.image ?? Assets.themeDefaultImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      theme.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: context.textTheme.bodyMedium?.copyWith(
        height: 1.2,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

//Placeholder
class Placeholder$ThemeCard extends StatelessWidget {
  const Placeholder$ThemeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme.surfaceVariant;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(kBorderRadius),
          clipBehavior: Clip.hardEdge,
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(color: color),
          ),
        ),
        Gap.h12,
        Container(
          color: color,
          width: 120,
          height: 20,
        ),
      ],
    );
  }
}
