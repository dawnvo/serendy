import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/collection/collection.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/presentation/@sheets/save_media_sheet.dart';
import 'package:serendy/src/presentation/collection/controller/collection_controller.dart';

part 'media_menu_controller.g.dart';

@riverpod
class MediaMenuController extends _$MediaMenuController {
  @override
  void build(Media media) {}

  /// 미디어 평가
  void onEvaluateMediaTapped(BuildContext context) {
    context.pop();
    context.pushNamed(
      AppRoutes.evaluateMediaName,
      extra: media,
    );
  }

  /// 미디어 저장
  void onSaveMediaTapped(BuildContext context) {
    context.pop();
    context.showCustomModalBottomSheet(
      (context) => SaveMediaSheet(media: media),
    );
  }

  /// 미디어 공유
  void onShareMediaTapped(BuildContext context) {}

  /// 미디어 숨기기
  Future<void> onHideMediaTapped(BuildContext context) async {
    // * 숨기기 로직

    // * 숨기기에 성공하면 메뉴를 닫아요.
    ref.read(goRouterProvider).pop();

    void cancelAction() {
      // * 숨기기 취소 로직
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      action: SnackBarAction(onPressed: cancelAction, label: "취소"),
      content: const Text('앞으로 이 작품은 보이지 않습니다.'),
    ));
  }

  /// 컬렉션 항목(미디어) 삭제
  Future<void> onDeleteCollectionItemTapped(
    BuildContext context,
    String? collectionId,
  ) async {
    try {
      // * 식별자를 전달받지 못한 경우 실행을 종료해요.
      if (collectionId == null) {
        ref.read(goRouterProvider).pop();
        throw Exception('삭제에 실패했어요. 다시 시도해 주세요.');
      }

      // * 해당 컬렉션 항목을 삭제해요.
      final collection = await ref.read(deleteCollectionItemProvider(
        id: collectionId,
        mediaId: media.id,
      ).future);

      // * 컬렉션 화면의 '상태'를 갱신해요.
      ref
          .read(collectionControllerProvider(collectionId).notifier)
          .update((state) => state.copyWith(collection: collection));

      // * 삭제에 성공하면 메뉴를 닫아요.
      ref.read(goRouterProvider).pop();
    } catch (err) {
      // * 삭제에 실패하면 메시지로 안내해요.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err.toString())),
      );
    }
  }
}

// ignore_for_file: invalid_use_of_protected_member
