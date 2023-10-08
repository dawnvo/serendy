import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/widgets/widgets.dart';

class MediaItem extends StatelessWidget {
  const MediaItem({
    required this.media,
    this.onTap,
    this.onMoreTap,
  });

  final Media media;
  final VoidCallback? onTap;
  final VoidCallback? onMoreTap;

  static const _imageSize = Sizes.p48;

  @override
  Widget build(BuildContext context) {
    return ListItem(
      onTap: onTap,
      image: media.image,
      title: media.title,
      trailing: _buildMoreButton(context),
    );
  }

  Widget? _buildMoreButton(BuildContext context) {
    if (onMoreTap == null) return null;
    return IconButton(
      icon: const Icon(RemixIcon.more_2_line),
      onPressed: onMoreTap,
      alignment: Alignment.centerRight,
      padding: EdgeInsets.zero,
      color: context.colorScheme.outline,
    );
  }
}

//Placeholder
class Placeholder$MediaItem extends StatelessWidget {
  const Placeholder$MediaItem();

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.textTheme.bodyLarge!;
    final color = context.colorScheme.surfaceVariant;
    final decoration = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(Sizes.p4)),
      color: color,
    );
    return Container(
      constraints: const BoxConstraints(minHeight: Sizes.p64),
      padding: const EdgeInsets.symmetric(horizontal: kContentPadding),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(kBorderRadius),
          clipBehavior: Clip.hardEdge,
          child: Container(
            width: MediaItem._imageSize,
            height: MediaItem._imageSize,
            color: color,
          ),
        ),
        Gap.w16,
        Container(
          width: 120,
          height: titleStyle.fontSize!,
          decoration: decoration,
        ),
      ]),
    );
  }
}
