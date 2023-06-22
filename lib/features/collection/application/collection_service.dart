import 'package:serendy/core/exceptions/core_exception.dart';
import 'package:serendy/features/auth/application/auth_service.dart';
import 'package:serendy/features/collection/collection.dart';
import 'package:serendy/features/collection/domain/usecases/add_collection_item_usecase.dart';
import 'package:serendy/features/collection/domain/usecases/create_collection_usecase.dart';
import 'package:serendy/features/collection/domain/usecases/delete_collection_item_usecase.dart';
import 'package:serendy/features/collection/domain/usecases/edit_collection_usecase.dart';
import 'package:serendy/features/collection/domain/usecases/get_collection_list_usecase.dart';
import 'package:serendy/features/collection/domain/usecases/get_collection_usecase.dart';
import 'package:serendy/features/collection/domain/usecases/remove_collection_usecase.dart';
import 'package:serendy/features/collection/domain/usecases/watch_collection_list_usecase.dart';

class CollectionService {
  const CollectionService(
    this._authService,
    this._getCollectionUsecase,
    this._getCollectionListUsecase,
    this._watchCollectionListUsecase,
    this._createCollectionUsecase,
    this._editCollectionUsecase,
    this._removeCollectionUsecase,
    this._addCollectionItemUsecase,
    this._deleteCollectionItemUsecase,
  );

  final AuthService _authService;
  final GetCollectionUsecase _getCollectionUsecase;
  final GetCollectionListUsecase _getCollectionListUsecase;
  final WatchCollectionListUsecase _watchCollectionListUsecase;
  final CreateCollectionUsecase _createCollectionUsecase;
  final EditCollectionUsecase _editCollectionUsecase;
  final RemoveCollectionUsecase _removeCollectionUsecase;
  final AddCollectionItemUsecase _addCollectionItemUsecase;
  final DeleteCollectionItemUsecase _deleteCollectionItemUsecase;

  /// 나의 컬렉션을 구독해요.
  Stream<List<Collection?>> watchMyCollectionsList() {
    final userId = _checkUserId(_authService.currentUserId);
    return _watchCollectionListUsecase.execute((userId: userId));
  }

  /// 여러 컬렉션을 불러와요.
  Future<List<Collection?>> fetchCollectionsList() {
    final userId = _authService.currentUserId;
    return _getCollectionListUsecase.execute((executorId: userId));
  }

  /// 컬렉션을 불러와요.
  Future<Collection> fetchCollection({
    required String id,
  }) {
    final userId = _authService.currentUserId;
    return _getCollectionUsecase.execute((
      executorId: userId,
      collectionId: id,
    ));
  }

  /// 컬렉션을 만들어요.
  Future<Collection> createCollection({
    required String title,
  }) {
    final userId = _checkUserId(_authService.currentUserId);
    return _createCollectionUsecase.execute((
      executorId: userId,
      title: title,
    ));
  }

  /// 컬렉션을 수정해요.
  Future<Collection> editCollection({
    required String id,
    required String title,
    final String? description,
    final String? image,
    final bool? private,
  }) {
    final userId = _checkUserId(_authService.currentUserId);
    return _editCollectionUsecase.execute((
      executorId: userId,
      collectionId: id,
      description: description,
      title: title,
      image: image,
      private: private,
    ));
  }

  /// 컬렉션을 제거해요.
  Future<void> removeCollection({
    required String id,
  }) {
    final userId = _checkUserId(_authService.currentUserId);
    return _removeCollectionUsecase.execute((
      executorId: userId,
      collectionId: id,
    ));
  }

  /// 컬렉션에 항목을 추가해요.
  Future<Collection> addCollectionItem({
    required String id,
    required String mediaId,
  }) {
    final userId = _checkUserId(_authService.currentUserId);
    return _addCollectionItemUsecase.execute((
      executorId: userId,
      collectionId: id,
      mediaId: mediaId,
    ));
  }

  /// 컬렉션 항목을 제거해요.
  Future<Collection> deleteCollectionItem({
    required String id,
    required String mediaId,
  }) {
    final userId = _checkUserId(_authService.currentUserId);
    return _deleteCollectionItemUsecase.execute((
      executorId: userId,
      collectionId: id,
      mediaId: mediaId,
    ));
  }

  String _checkUserId(String? userId) {
    if (userId == null) throw const UnauthorizedException();
    return userId;
  }
}
