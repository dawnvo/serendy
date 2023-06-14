import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/domain/collection.dart';

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

  Future<void> _onFetched(
    CollectionFetched event,
    Emitter<CollectionState> emit,
  ) async {}

  Future<void> _onListFetched(
    CollectionsListFetched event,
    Emitter<CollectionState> emit,
  ) async {}

  Future<void> _onCreated(
    CollectionCreated event,
    Emitter<CollectionState> emit,
  ) async {}

  Future<void> _onEdited(
    CollectionEdited event,
    Emitter<CollectionState> emit,
  ) async {}

  Future<void> _onRemoved(
    CollectionRemoved event,
    Emitter<CollectionState> emit,
  ) async {}

  Future<void> _onItemAdded(
    CollectionItemAdded event,
    Emitter<CollectionState> emit,
  ) async {}

  Future<void> _onItemDeleted(
    CollectionItemDeleted event,
    Emitter<CollectionState> emit,
  ) async {}
}
