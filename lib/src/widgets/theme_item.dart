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
      subtitle: Text('작품 ${theme.itemsCount}'),
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
    final titleStyle = context.textTheme.bodyMedium!;
    final subtitleStyle = context.textTheme.bodySmall!;
    final color = context.colorScheme.surfaceVariant;
    final decoration = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(Sizes.p4)),
      color: color,
    );
    return Container(
      constraints: const BoxConstraints(minHeight: Sizes.p72),
      padding: const EdgeInsets.symmetric(horizontal: kContentPadding),
      child: Row(children: [
        //image
        ClipRRect(
          borderRadius: BorderRadius.circular(kBorderRadius),
          clipBehavior: Clip.hardEdge,
          child: Container(
            width: ThemeItem._imageSize,
            height: ThemeItem._imageSize,
            color: color,
          ),
        ),
        Gap.w16,
        //titles
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: titleStyle.fontSize!,
              decoration: decoration,
            ),
            Gap.h8,
            Container(
              width: 64,
              height: subtitleStyle.fontSize!,
              decoration: decoration,
            ),
          ],
        ),
      ]),
    );
  }
}
