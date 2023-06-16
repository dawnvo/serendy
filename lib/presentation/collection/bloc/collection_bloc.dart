import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graphql/client.dart';
import 'package:serendy/features/collection/application/get_collection_service.dart';
import 'package:serendy/features/collection/domain/collection.dart';

part 'collection_event.dart';
part 'collection_state.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  CollectionBloc({required this.getCollectionUseCase})
      : super(const CollectionLoading()) {
    on<CollectionFetched>(_onFetched);
  }

  final GetCollectionUseCase getCollectionUseCase;

  Future<void> _onFetched(
    CollectionFetched event,
    Emitter<CollectionState> emit,
  ) async {
    try {
      final collection =
          await getCollectionUseCase.execute((collectionId: event.id));

      emit(CollectionLoaded(collection: collection));
    } on GraphQLError catch (err) {
      emit(CollectionError(err.message));
    } catch (err) {
      emit(CollectionError(err.toString()));
    }
  }
}