import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/features/media/data/media_repository.dart';
import 'package:serendy/features/media/domain/media.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.mediaRepository}) : super(const HomeInitial()) {
    on<Home$MediasListFetched>(_onMediasListFetched);
  }

  final MediaRepository mediaRepository;

  Future<void> _onMediasListFetched(
    Home$MediasListFetched event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoading());
    try {
      final medias = await mediaRepository.fetchMediasList();
      emit(HomeLoaded(medias: medias));
    } catch (err) {
      emit(HomeError(err.toString()));
    }
  }
}
