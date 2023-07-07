import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';

class MediaCard extends StatelessWidget {
  const MediaCard({
    required this.media,
    super.key,
    this.onTap,
    this.onLongPress,
  });

  final Media media;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kBorderRadius),
      clipBehavior: Clip.hardEdge,
      child: Material(
        child: DecoratedBox(
          // [Image] 위젯에 그라디언트 효과를 적용해요.
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [
                0.5,
                1.0,
              ],
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.72),
              ],
            ),
          ),

          // [Material] 위젯에 스플래시 효과를 전달해요.
          child: Ink.image(
            image: NetworkImage(media.image),
            fit: BoxFit.cover,
            child: InkWell(
              onTap: onTap,
              onLongPress: onLongPress,
              child: _buildTitle(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.p8,
          vertical: Sizes.p12,
        ),
        child: Text(
          media.title,
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.bodyLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

//Placeholder
class Placeholder$MediaCard extends StatelessWidget {
  const Placeholder$MediaCard({super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme.surfaceVariant;
    return ClipRRect(
      borderRadius: BorderRadius.circular(kBorderRadius),
      clipBehavior: Clip.hardEdge,
      child: Container(color: color),
    );
  }
}
