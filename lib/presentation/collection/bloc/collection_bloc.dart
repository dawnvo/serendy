import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/features/collection/collection.dart';

part 'collection_event.dart';
part 'collection_state.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  CollectionBloc({required this.collectionService})
      : super(const CollectionLoading()) {
    on<Collection$Fetched>(_onFetched);
  }

  final CollectionService collectionService;

  Future<void> _onFetched(
    Collection$Fetched event,
    Emitter<CollectionState> emit,
  ) async {
    try {
      final collection = await collectionService.fetchCollection(
        id: event.id,
      );

      emit(CollectionLoaded(collection: collection));
    } catch (err) {
      emit(CollectionError(err.toString()));
    }
  }
}
