part of '../media_screen.dart';

class MediaMenuSheet extends StatelessWidget {
  const MediaMenuSheet({super.key});

  /// 작품 숨기기 이벤트
  void handleHideMedia(BuildContext context) {
    context.popRoute();
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
    return SingleChildScrollView(
      child: Column(children: [
        Gap.h4,
        MediaItem(media: mediaMock),
        Gap.h4,
        const Divider(),
        Column(children: [
          _MediaMenuTile(
            onTap: () {},
            icon: const Icon(RemixIcon.emotion_fill),
            title: "감상했어요",
          ),
          _MediaMenuTile(
            onTap: () {},
            icon: const Icon(RemixIcon.add_box_fill),
            title: "테마에 추가하기",
          ),
          _MediaMenuTile(
            onTap: () => handleHideMedia(context),
            icon: const Icon(RemixIcon.indeterminate_circle_fill),
            title: "작품 숨기기",
          ),
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
