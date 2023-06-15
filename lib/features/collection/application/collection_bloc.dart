import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/_mock.dart';
import 'package:serendy/core/assert.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/domain/collection.dart';
import 'package:serendy/features/media/domain/media.dart';
import 'package:serendy/features/user/domain/user.dart';

part 'collection_event.dart';
part 'collection_state.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  CollectionBloc({required this.collectionRepository})
      : super(const CollectionLoading()) {
    on<CollectionFetched>(_onFetched);
    on<CollectionsListFetched>(_onListFetched);
    on<CollectionCreated>(_onCreated);
    on<CollectionEdited>(_onEdited);
    on<CollectionRemoved>(_onRemoved);
    on<CollectionItemAdded>(_onItemAdded);
    on<CollectionItemDeleted>(_onItemDeleted);
  }

  final CollectionRepository collectionRepository;

  static const _executorId = 'uid';

  /// Get collection
  ///
  /// 1. 컬렉션이 존재하는지 확인해요.
  /// 2. 비공개 컬렉션는 소유자만 조회할 수 있어요.
  /// 3. 상태를 갱신해요.🔥
  Future<void> _onFetched(
    CollectionFetched event,
    Emitter<CollectionState> emit,
  ) async {
    try {
      // [1]
      final collection = CoreAssert.notEmpty<Collection>(
        await collectionRepository.fetchCollection(event.id),
        Exception("컬렉션을 찾을 수 없어요."),
      );

      // [2]
      final hasAccess = collection.private == false || /*_*/
          collection.owner.id == _executorId;
      CoreAssert.isTrue(hasAccess, Exception('접근 권한이 없어요.'));

      // [3]
      emit(CollectionLoaded(collection: collection));
    } catch (err) {
      emit(CollectionError(err.toString()));
    }
  }

  /// Get collection list
  ///
  /// 1. 컬렉션 목록을 조회해요.
  /// -. 제거한 컬렉션는 조회하지 않아요.
  /// -. 비공개 컬렉션는 소유자만 조회할 수 있어요.
  /// 2. 상태를 갱신해요.🔥
  Future<void> _onListFetched(
    CollectionsListFetched event,
    Emitter<CollectionState> emit,
  ) async {
    try {
      // [1]
      final collections = await collectionRepository.fetchCollectionList();

      // [2]
      emit(CollectionsListLoaded(collections: collections));
    } catch (err) {
      emit(CollectionError(err.toString()));
    }
  }

  /// Create collection
  ///
  /// 1. 사용자가 존재하는지 확인해요.
  /// 2. 컬렉션을 생성해요.
  /// 3. 상태를 갱신해요.🔥
  Future<void> _onCreated(
    CollectionCreated event,
    Emitter<CollectionState> emit,
  ) async {
    try {
      // [1]
      final user = CoreAssert.notEmpty<User>(
        userMock,
        Exception("사용자를 찾을 수 없어요."),
      );

      // [2]
      final collection = Collection(
        owner: CollectionOwner(
          id: _executorId,
          name: user.name,
        ),
        title: event.title,
      );

      await collectionRepository.createCollection(collection);

      // [3]
      emit(CollectionLoaded(collection: collection));
    } catch (err) {
      emit(CollectionError(err.toString()));
    }
  }

  /// Edit collection
  ///
  /// 1. 컬렉션이 존재하는지 확인해요.
  /// 2. 올바른 실행자인지 확인해요.
  /// 3. 컬렉션을 수정해요.
  /// 4. 상태를 갱신해요.🔥
  Future<void> _onEdited(
    CollectionEdited event,
    Emitter<CollectionState> emit,
  ) async {
    try {
      // [1]
      final collection = CoreAssert.notEmpty<Collection>(
        await collectionRepository.fetchCollection(event.id),
        Exception("컬렉션을 찾을 수 없어요."),
      );

      // [2]
      final hasAccess = _executorId == collection.owner.id;
      CoreAssert.isTrue(hasAccess, Exception('접근 권한이 없어요.'));

      // [3]
      final edited = collection.edit(
        image: event.image,
        title: event.title,
        description: event.description,
        private: event.private,
      );

      await collectionRepository.updateCollection(edited);

      // [4]
      emit(CollectionLoaded(collection: collection));
    } catch (err) {
      emit(CollectionError(err.toString()));
    }
  }

  /// Remove collection
  ///
  /// 1. 컬렉션이 존재하는지 확인해요.
  /// 2. 올바른 실행자인지 확인해요.
  /// 3. 컬렉션을 제거해요.
  /// 4. 상태를 갱신해요.🔥
  Future<void> _onRemoved(
    CollectionRemoved event,
    Emitter<CollectionState> emit,
  ) async {
    try {
      // [1]
      final collection = CoreAssert.notEmpty<Collection>(
        await collectionRepository.fetchCollection(event.id),
        Exception("컬렉션을 찾을 수 없어요."),
      );

      // [2]
      final hasAccess = _executorId == collection.owner.id;
      CoreAssert.isTrue(hasAccess, Exception('접근 권한이 없어요.'));

      // [3]
      final removed = collection.remove();
      await collectionRepository.removeCollection(removed);

      // [4]
      emit(CollectionLoaded(collection: removed));
    } catch (err) {
      emit(CollectionError(err.toString()));
    }
  }

  /// Add collection item
  ///
  /// 1. 컬렉션이 존재하는지 확인해요.
  /// 2. 올바른 실행자인지 확인해요.
  /// 3. 미디어가 존재하는지 확인해요.
  /// 4. 컬렉션에 항목을 추가해요.
  /// 5. 상태를 갱신해요.🔥
  Future<void> _onItemAdded(
    CollectionItemAdded event,
    Emitter<CollectionState> emit,
  ) async {
    try {
      // [1]
      final collection = CoreAssert.notEmpty<Collection>(
        await collectionRepository.fetchCollection(event.id),
        Exception("컬렉션을 찾을 수 없어요."),
      );

      // [2]
      final hasAccess = _executorId == collection.owner.id;
      CoreAssert.isTrue(hasAccess, Exception('접근 권한이 없어요.'));

      // [3]
      final media = CoreAssert.notEmpty<Media>(
        mediaMock,
        Exception("미디어를 찾을 수 없어요."),
      );

      // [4]
      final itemAdded = collection.addItem(CollectionItem(
        addedAt: DateTime.now(),
        media: Media(
          id: media.id,
          type: media.type,
          status: media.status,
          title: media.title,
          image: media.image,
          synopsis: media.synopsis,
          keywords: media.keywords,
          isAdult: media.isAdult,
          startDate: media.startDate,
          endDate: media.endDate,
        ),
      ));

      await collectionRepository.updateCollection(itemAdded);

      // [5]
      emit(CollectionLoaded(collection: collection));
    } catch (err) {
      emit(CollectionError(err.toString()));
    }
  }

  /// Delete collection item
  ///
  /// 1. 컬렉션이 존재하는지 확인해요.
  /// 2. 올바른 실행자인지 확인해요.
  /// 3. 컬렉션의 항목을 삭제해요.
  /// 4. 상태를 갱신해요.🔥
  Future<void> _onItemDeleted(
    CollectionItemDeleted event,
    Emitter<CollectionState> emit,
  ) async {
    try {
      // [1]
      final collection = CoreAssert.notEmpty<Collection>(
        await collectionRepository.fetchCollection(event.id),
        Exception("컬렉션을 찾을 수 없어요."),
      );

      // [2]
      final hasAccess = _executorId == collection.owner.id;
      CoreAssert.isTrue(hasAccess, Exception('접근 권한이 없어요.'));

      // [3]
      final itemDeleted = collection.deleteItem(event.mediaId);
      await collectionRepository.updateCollection(itemDeleted);

      // [4]
      emit(CollectionLoaded(collection: collection));
    } catch (err) {
      emit(CollectionError(err.toString()));
    }
  }
}
