import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/domain/collection.dart';

part 'collection_event.dart';
part 'collection_state.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  CollectionBloc({required this.collectionRepository})
      : super(const CollectionLoading()) {
    on<Collection$Fetched>(_onFetched);
  }

  final CollectionRepository collectionRepository;

  Future<void> _onFetched(
    Collection$Fetched event,
    Emitter<CollectionState> emit,
  ) async {
    try {
      final collection = await collectionRepository.fetchCollection(
        collectionId: event.id,
      );

      emit(CollectionLoaded(collection: collection));
    } catch (err) {
      emit(CollectionError(err.toString()));
    }
  }
}
