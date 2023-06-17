import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/domain/collection.dart';

part 'discover_event.dart';
part 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  DiscoverBloc({required this.collectionRepository})
      : super(const DiscoverLoading()) {
    on<Discover$CollectionsListFetched>(_onCollectionsListFetched);
  }

  final CollectionRepository collectionRepository;

  Future<void> _onCollectionsListFetched(
    Discover$CollectionsListFetched event,
    Emitter<DiscoverState> emit,
  ) async {
    try {
      final collections = await collectionRepository.fetchCollectionsList();
      emit(DiscoverLoaded(collections: collections));
    } catch (err) {
      emit(DiscoverError(err.toString()));
    }
  }
}
