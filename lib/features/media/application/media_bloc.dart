import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/core/assert.dart';
import 'package:serendy/features/evaluation/data/evaluation_repository.dart';
import 'package:serendy/features/evaluation/domain/evaluation.dart';
import 'package:serendy/features/media/data/media_repository.dart';
import 'package:serendy/features/media/domain/media.dart';

part 'media_event.dart';
part 'media_state.dart';

class MediaBloc extends Bloc<MediaEvent, MediaState> {
  MediaBloc({
    required this.mediaRepository,
    required this.evaluationRepository,
  }) : super(const MediaLoading()) {
    on<MediaFetched>(_onFetched);
    on<MediasListFetched>(_onListFetched);
  }

  final MediaRepository mediaRepository;
  final EvaluationRepository evaluationRepository;

  Future<void> _onFetched(
    MediaFetched event,
    Emitter<MediaState> emit,
  ) async {
    try {
      final media = CoreAssert.notEmpty<Media>(
        await mediaRepository.fetchMedia(event.id),
        Exception("미디어를 찾을 수 없어요."),
      );

      final reactions = await evaluationRepository.fetchEvaluationList();

      emit(MediaLoaded(
        media: media,
        reactions: reactions,
      ));
    } catch (err) {
      emit(MediaError(err.toString()));
    }
  }

  Future<void> _onListFetched(
    MediasListFetched event,
    Emitter<MediaState> emit,
  ) async {
    try {
      final medias = await mediaRepository.fetchMediaList();

      emit(MediasListLoaded(medias: medias));
    } catch (err) {
      emit(MediaError(err.toString()));
    }
  }
}
