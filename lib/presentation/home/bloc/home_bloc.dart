import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/features/media/media.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.mediaService}) : super(const HomeInitial()) {
    on<Home$MediasListFetched>(_onMediasListFetched);
  }

  final MediaService mediaService;

  Future<void> _onMediasListFetched(
    Home$MediasListFetched event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoading());
    try {
      final medias = await mediaService.fetchMediasList();
      emit(HomeLoaded(medias: medias));
    } catch (err) {
      emit(HomeError(err.toString()));
    }
  }
}
