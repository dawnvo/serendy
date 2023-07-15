import 'package:cached_network_image/cached_network_image.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    required this.evaluation,
    this.onTap,
    this.onMoreTap,
  });

  final Evaluation evaluation;
  final VoidCallback? onTap;
  final VoidCallback? onMoreTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(children: [
        _buildImage(context),
        Gap.h4,
        Row(children: [
          SvgPicture.asset(
            evaluation.emotion.filePath,
            width: 24,
            height: 24,
          ),
          Gap.w8,
          Expanded(
            child: Text(
              evaluation.media.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          _buildMoreButton(context),
        ]),
      ]),
    );
  }

  Widget _buildImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kBorderRadius),
      clipBehavior: Clip.hardEdge,
      child: CachedNetworkImage(
        imageUrl: evaluation.media.image,
        fit: BoxFit.cover,
        width: double.infinity,
        height: 160,
      ),
    );
  }

  Widget _buildMoreButton(BuildContext context) {
    return IconButton(
      onPressed: onMoreTap,
      icon: const Icon(RemixIcon.more_2_line),
      alignment: Alignment.centerRight,
      padding: EdgeInsets.zero,
      color: context.colorScheme.outline,
    );
  }
}
