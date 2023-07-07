import 'package:serendy/src/configs/configs.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    required this.image,
    required this.title,
    this.trailing,
    this.onTap,
  });

  final String image;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  static const _imageSize = Sizes.p48;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: kContentPadding),
        height: Sizes.p64,
        child: Row(children: [
          _buildImage(context),
          Gap.w16,
          Expanded(child: _buildTitle(context)),
          if (trailing != null) trailing!,
        ]),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kBorderRadius),
      clipBehavior: Clip.hardEdge,
      child: Image.network(
        image,
        fit: BoxFit.cover,
        width: _imageSize,
        height: _imageSize,
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: context.textTheme.bodyMedium,
    );
  }
}
