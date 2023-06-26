import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/remixicon.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/sheets/sheets.dart';
import 'package:serendy/src/widgets/widgets.dart';

class SaveMediaTile extends StatelessWidget {
  const SaveMediaTile({required this.media, super.key});

  final Media media;

  void handleTap(BuildContext context) {
    context.pop();
    context.showCustomModalBottomSheet(
      (context) => SaveMediaSheet(media: media),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MenuListTile(
      onTap: () => handleTap(context),
      icon: const Icon(RemixIcon.add_box_fill),
      title: "테마에 추가하기",
    );
  }
}
