import 'package:flutter/material.dart';
import 'package:flutter_remix_icon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serendy/src/features/collection/collection.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/screens/collection/controller/collection_controller.dart';
import 'package:serendy/src/widgets/widgets.dart';

class DeleteCollectionItemTile extends ConsumerWidget {
  const DeleteCollectionItemTile({
    required this.collection,
    required this.media,
    super.key,
  });

  final Collection collection;
  final Media media;

  Future<void> handleTap(BuildContext context, WidgetRef ref) async {
    try {
      // * 해당 컬렉션 항목을 삭제해요.
      await ref.read(deleteCollectionItemProvider(
        id: collection.id,
        mediaId: media.id,
      ).future);

      // * 컬렉션 화면의 상태를 갱신해요.
      ref
          .read(collectionControllerProvider(collection.id).notifier)
          .collectionUpdated();

      // * 위젯이 폐기되지 않은 경우에만 실행을 계속해요.
      if (!context.mounted) return;

      // * 삭제에 성공하면 메뉴를 닫고 메시지로 안내해요.
      context.pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("${collection.title}에서 삭제했어요.")),
      );
    } catch (err) {
      // * 삭제에 실패하면 메시지로 안내해요.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MenuListTile(
      onTap: () => handleTap(context, ref),
      icon: const Icon(RemixIcon.indeterminate_circle_fill),
      title: "이 테마에서 삭제하기",
    );
  }
}
