import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/features/collection/collection.dart';

part 'my_collections_event.dart';
part 'my_collections_state.dart';

class MyCollectionsBloc extends Bloc<MyCollectionsEvent, MyCollectionsState> {
  MyCollectionsBloc({required this.collectionService})
      : super(const MyCollectionsState()) {
    on<MyCollections$Fetched>(_onFetched);
    on<MyCollections$ItemAdded>(_onItemAdded);
    on<MyCollections$ItemDeleted>(_onItemDeleted);
  }

  final CollectionService collectionService;

  Future<void> _onFetched(
    MyCollections$Fetched event,
    Emitter<MyCollectionsState> emit,
  ) async {
    emit(state.copyWith(status: MyCollectionsStatus.loading));

    await emit.forEach(
      collectionService.watchMyCollectionsList(),
      onData: (collections) => state.copyWith(
        status: MyCollectionsStatus.success,
        collections: collections,
      ),
      onError: (err, stack) => state.copyWith(
        status: MyCollectionsStatus.failure,
        errorMessage: err.toString(),
      ),
    );
  }

  Future<void> _onItemAdded(
    MyCollections$ItemAdded event,
    Emitter<MyCollectionsState> emit,
  ) async {
    /// 컬렉션을 불러온 후 추가할 수 있어요.
    try {
      await collectionService.addCollectionItem(
        id: event.collectionId,
        mediaId: event.mediaId,
      );
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
      await collectionService.deleteCollectionItem(
        id: event.collectionId,
        mediaId: event.mediaId,
      );
    } catch (err) {
      emit(state.copyWith(
        status: MyCollectionsStatus.failure,
        errorMessage: err.toString(),
      ));
    }
  }
}
