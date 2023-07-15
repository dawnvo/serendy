import 'package:cached_network_image/cached_network_image.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/theme/theme.dart';

class ThemeItem extends StatelessWidget {
  const ThemeItem({
    required this.theme,
    this.onTap,
  });

  final Theme theme;
  final VoidCallback? onTap;

  static const _imageSize = Sizes.p56;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: kContentPadding,
      ),
      titleTextStyle: context.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w500,
      ),
      subtitleTextStyle: context.textTheme.bodySmall?.copyWith(
        color: context.colorScheme.onSurfaceVariant,
      ),
      onTap: onTap,
      leading: _buildImage(context),
      title: Text(theme.title),
      subtitle: Text('작품 ${theme.itemCount}'),
    );
  }

  Widget _buildImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kBorderRadius),
      clipBehavior: Clip.hardEdge,
      child: CachedNetworkImage(
        imageUrl: theme.image ?? Assets.themeDefaultImage,
        fit: BoxFit.cover,
        width: _imageSize,
        height: _imageSize,
      ),
    );
  }
}

//Placeholder
class Placeholder$ThemeItem extends StatelessWidget {
  const Placeholder$ThemeItem();

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme.surfaceVariant;
    const imageSize = ThemeItem._imageSize;
    final titleSize = context.textTheme.bodyMedium!;
    final subtitleSize = context.textTheme.bodySmall!;
    return Container(
      constraints: const BoxConstraints(minHeight: Sizes.p72),
      padding: const EdgeInsets.symmetric(horizontal: kContentPadding),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(kBorderRadius),
          clipBehavior: Clip.hardEdge,
          child: Container(
            color: color,
            width: imageSize,
            height: imageSize,
          ),
        ),
        Gap.w16,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: color,
              width: 120,
              height: titleSize.fontSize! * titleSize.height!,
            ),
            Gap.h4,
            Container(
              color: color,
              width: 64,
              height: subtitleSize.fontSize! * subtitleSize.height!,
            ),
          ],
        ),
      ]),
    );
  }
}
