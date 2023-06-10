import 'package:flutter/material.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/models/models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    required this.evaluation,
    super.key,
    this.onTap,
    this.onMore,
  });

  final Evaluation evaluation;
  final VoidCallback? onTap;
  final VoidCallback? onMore;

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
        height: 180,
      ),
    );
  }

  Widget _buildMoreButton(BuildContext context) {
    return IconButton(
      icon: const Icon(RemixIcon.more_2_line),
      onPressed: onMore,
      alignment: Alignment.centerRight,
      padding: EdgeInsets.zero,
      color: context.colorScheme.outline,
    );
  }
}
