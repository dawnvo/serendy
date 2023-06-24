import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/features/auth/application/auth_service.dart';
import 'package:serendy/src/features/collection/collection.dart';

part 'collection_service.g.dart';

/// 나의 컬렉션을 구독해요.
@Riverpod(keepAlive: true)
Stream<List<Collection?>> watchMyCollectionsList(
    WatchMyCollectionsListRef ref) {
  final userId = ref.watch(requireUserIdProvider);
  return CollectionModule.watchCollectionListUsecase.execute((userId: userId));
}

/// 여러 컬렉션을 불러와요.
@riverpod
Future<List<Collection?>> fetchCollectionsList(FetchCollectionsListRef ref) {
  final userId = ref.watch(userIdProvider);
  return CollectionModule.getCollectionListUsecase
      .execute((executorId: userId));
}

/// 컬렉션을 불러와요.
@riverpod
Future<Collection> fetchCollection(
  FetchCollectionRef ref, {
  required String id,
}) {
  final userId = ref.watch(userIdProvider);
  return CollectionModule.getCollectionUsecase.execute((
    executorId: userId,
    collectionId: id,
  ));
}

/// 컬렉션을 만들어요.
@riverpod
Future<Collection> createCollection(
  CreateCollectionRef ref, {
  required String title,
}) {
  final userId = ref.watch(requireUserIdProvider);
  return CollectionModule.createCollectionUsecase.execute((
    executorId: userId,
    title: title,
  ));
}

/// 컬렉션을 수정해요.
@riverpod
Future<Collection> editCollection(
  EditCollectionRef ref, {
  required String id,
  required String title,
  final String? description,
  final String? image,
  final bool? private,
}) {
  final userId = ref.watch(requireUserIdProvider);
  return CollectionModule.editCollectionUsecase.execute((
    executorId: userId,
    collectionId: id,
    description: description,
    title: title,
    image: image,
    private: private,
  ));
}

/// 컬렉션을 제거해요.
@riverpod
Future<void> removeCollection(
  RemoveCollectionRef ref, {
  required String id,
}) {
  final userId = ref.watch(requireUserIdProvider);
  return CollectionModule.removeCollectionUsecase.execute((
    executorId: userId,
    collectionId: id,
  ));
}

/// 컬렉션에 항목을 추가해요.
@riverpod
Future<Collection> addCollectionItem(
  AddCollectionItemRef ref, {
  required String id,
  required String mediaId,
}) {
  final userId = ref.watch(requireUserIdProvider);
  return CollectionModule.addCollectionItemUsecase.execute((
    executorId: userId,
    collectionId: id,
    mediaId: mediaId,
  ));
}

/// 컬렉션 항목을 제거해요.
@riverpod
Future<Collection> deleteCollectionItem(
  DeleteCollectionItemRef ref, {
  required String id,
  required String mediaId,
}) {
  final userId = ref.watch(requireUserIdProvider);
  return CollectionModule.deleteCollectionItemUsecase.execute((
    executorId: userId,
    collectionId: id,
    mediaId: mediaId,
  ));
}
