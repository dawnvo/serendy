import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graphql/client.dart';
import 'package:serendy/features/collection/application/get_collections_list_service.dart';
import 'package:serendy/features/collection/domain/collection.dart';

part 'discover_event.dart';
part 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  DiscoverBloc({required this.getCollectionsListUseCase})
      : super(const DiscoverLoading()) {
    on<Discover$CollectionsListFetched>(_onCollectionsListFetched);
  }

  final GetCollectionsListUseCase getCollectionsListUseCase;

  Future<void> _onCollectionsListFetched(
    Discover$CollectionsListFetched event,
    Emitter<DiscoverState> emit,
  ) async {
    try {
      final collections =
          await getCollectionsListUseCase.execute((ownerId: ''));

      emit(DiscoverLoaded(collections: collections));
    } on GraphQLError catch (err) {
      emit(DiscoverError(err.message));
    } catch (err) {
      emit(DiscoverError(err.toString()));
    }
  }
}
