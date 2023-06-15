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

  /// Get media
  ///
  /// 1. 미디어가 존재하는지 확인해요.
  /// 2. 미디어의 반응을 조회해요.
  /// 3. 상태를 갱신해요.🔥
  Future<void> _onFetched(
    MediaFetched event,
    Emitter<MediaState> emit,
  ) async {
    try {
      // [1]
      final media = CoreAssert.notEmpty<Media>(
        await mediaRepository.fetchMedia(event.id),
        Exception("미디어를 찾을 수 없어요."),
      );

      // [2]
      final reactions = await evaluationRepository.fetchEvaluationList();

      // [3]
      emit(MediaLoaded(
        media: media,
        reactions: reactions,
      ));
    } catch (err) {
      emit(MediaError(err.toString()));
    }
  }

  /// Get media list
  ///
  /// 1. 미디어를 조회해요.
  /// 2. 상태를 갱신해요.🔥
  Future<void> _onListFetched(
    MediasListFetched event,
    Emitter<MediaState> emit,
  ) async {
    try {
      // [1]
      final medias = await mediaRepository.fetchMediaList();

      // [2]
      emit(MediasListLoaded(medias: medias));
    } catch (err) {
      emit(MediaError(err.toString()));
    }
  }
}
