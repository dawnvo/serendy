import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/features/media/data/media_repository.dart';
import 'package:serendy/features/media/domain/media.dart';

part 'media_event.dart';
part 'media_state.dart';

class MediaBloc extends Bloc<MediaEvent, MediaState> {
  MediaBloc({required this.mediaRepository}) : super(const MediaLoading()) {
    on<Media$Fetched>(_onFetched);
  }

  final MediaRepository mediaRepository;

  Future<void> _onFetched(
    Media$Fetched event,
    Emitter<MediaState> emit,
  ) async {
    try {
      final media = await mediaRepository.fetchMedia(mediaId: event.id);

      emit(MediaLoaded(media: media));
    } catch (err) {
      emit(MediaError(err.toString()));
    }
  }
}
