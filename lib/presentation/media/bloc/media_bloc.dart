import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/features/evaluation/evaluation.dart';
import 'package:serendy/features/media/media.dart';

part 'media_event.dart';
part 'media_state.dart';

class MediaBloc extends Bloc<MediaEvent, MediaState> {
  MediaBloc({
    required this.mediaService,
    required this.evaluationService,
  }) : super(const MediaLoading()) {
    on<Media$Fetched>(_onFetched);
  }

  final MediaService mediaService;
  final EvaluationService evaluationService;

  Future<void> _onFetched(
    Media$Fetched event,
    Emitter<MediaState> emit,
  ) async {
    try {
      final media = await mediaService.fetchMedia(mediaId: event.id);
      final reactions = await evaluationService.fetchReactionsList(
        mediaId: event.id,
      );

      emit(MediaLoaded(media: media, reactions: reactions));
    } catch (err) {
      emit(MediaError(err.toString()));
    }
  }
}
