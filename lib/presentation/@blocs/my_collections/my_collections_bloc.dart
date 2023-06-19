import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/domain/collection.dart';

part 'my_collections_event.dart';
part 'my_collections_state.dart';

class MyCollectionsBloc extends Bloc<MyCollectionsEvent, MyCollectionsState> {
  MyCollectionsBloc({required this.collectionRepository})
      : super(const MyCollectionsState()) {
    on<MyCollections$Fetched>(_onFetched);
    on<MyCollections$ItemAdded>(_onItemAdded);
    on<MyCollections$ItemDeleted>(_onItemDeleted);
  }

  final CollectionRepository collectionRepository;

  Future<void> _onFetched(
    MyCollections$Fetched event,
    Emitter<MyCollectionsState> emit,
  ) async {
    emit(state.copyWith(status: MyCollectionsStatus.loading));

    try {
      final collections = await collectionRepository.fetchCollectionsList(
        ownerId: '01H32VTAB65FMME5N8HMDT70GY',
      );

      emit(state.copyWith(
        status: MyCollectionsStatus.success,
        collections: collections,
      ));
    } catch (err) {
      emit(state.copyWith(
        status: MyCollectionsStatus.failure,
        errorMessage: err.toString(),
      ));
    }
  }

  Future<void> _onItemAdded(
    MyCollections$ItemAdded event,
    Emitter<MyCollectionsState> emit,
  ) async {
    /// 컬렉션을 불러온 후 추가할 수 있어요.
    try {
      await collectionRepository.addCollectionItem(
        collectionId: event.collectionId,
        mediaId: event.mediaId,
      );

      // add(const MyCollections$Fetched());
    } catch (err) {
      emit(state.copyWith(
        status: MyCollectionsStatus.failure,
        errorMessage: err.toString(),
      ));
    }
  }

  Future<void> _onItemDeleted(
    MyCollections$ItemDeleted event,
    Emitter<MyCollectionsState> emit,
  ) async {
    /// 컬렉션을 불러온 후 삭제할 수 있어요.
    try {
      await collectionRepository.deleteCollectionItem(
        collectionId: event.collectionId,
        mediaId: event.mediaId,
      );

      // add(const MyCollections$Fetched());
    } catch (err) {
      emit(state.copyWith(
        status: MyCollectionsStatus.failure,
        errorMessage: err.toString(),
      ));
    }
  }
}
