import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/flutter_remix_icon.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/features/media/media.dart';
import 'package:serendy/presentation/@widgets/widgets.dart';

enum MediaMenuType {
  media,
  collection,
}

class MediaMenuSheet extends StatelessWidget {
  const MediaMenuSheet({
    this.type = MediaMenuType.media,
    required this.media,
    super.key,
  });

  final MediaMenuType type;
  final Media media;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Gap.h4,
        MediaItem(media: media),
        Gap.h4,
        const Divider(),
        Column(children: [
          _MediaMenuTile(
            onTap: () {
              context.pop();
              context.push('/evaluate-media', extra: media);
            },
            icon: const Icon(RemixIcon.emotion_fill),
            title: "감상했어요",
          ),
          _MediaMenuTile(
            onTap: () {},
            icon: const Icon(RemixIcon.add_box_fill),
            title: "테마에 추가하기",
          ),

          /// 기본적으로 '작품 숨기기' 타일을 보여줘요.
          if (type == MediaMenuType.media)
            const _HideMediaTile()

          /// 컬력션에서 메뉴를 열면 '이 테마에서 삭제하기' 타일을 보여줘요.
          else if (type == MediaMenuType.collection)
            const _DeleteCollectionItemTile(),

          _MediaMenuTile(
            onTap: () {},
            icon: const Icon(RemixIcon.share_fill),
            title: "공유하기",
          ),
        ]),
      ]),
    );
  }
}

/// '이 작품 숨기기' 타일
class _HideMediaTile extends StatelessWidget {
  const _HideMediaTile();

  void handleHideMedia(BuildContext context) {
    context.pop();
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          action: SnackBarAction(
            onPressed: () {},
            label: "취소",
          ),
          content: const Text('앞으로 이 작품은 보이지 않습니다.'),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return _MediaMenuTile(
      onTap: () => handleHideMedia(context),
      icon: const Icon(RemixIcon.indeterminate_circle_fill),
      title: "이 작품 숨기기",
    );
  }
}

/// '이 테마에서 삭제하기' 타일
class _DeleteCollectionItemTile extends StatelessWidget {
  const _DeleteCollectionItemTile();

  void handleDeleteCollectionItem(BuildContext context) {
    context.pop();
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(content: Text('테마에서 삭제했어요.')),
      );
  }

  @override
  Widget build(BuildContext context) {
    return _MediaMenuTile(
      onTap: () => handleDeleteCollectionItem(context),
      icon: const Icon(RemixIcon.indeterminate_circle_fill),
      title: "이 테마에서 삭제하기",
    );
  }
}

/// MediaMenu tile
class _MediaMenuTile extends StatelessWidget {
  const _MediaMenuTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final Widget icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: icon,
      title: Text(title),
      iconColor: context.colorScheme.outline,
      titleTextStyle: context.textTheme.bodyMedium,
    );
  }
}
