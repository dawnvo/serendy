import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/features/media/data/media_repository.dart';
import 'package:serendy/features/media/domain/media.dart';

part 'media_event.dart';
part 'media_state.dart';

class MediaBloc extends Bloc<MediaEvent, MediaState> {
  MediaBloc({required this.mediaRepository}) : super(const MediaLoading()) {
    on<MediaFetched>(_onFetched);
    on<MediasListFetched>(_onListFetched);
  }

  final MediaRepository mediaRepository;

  Future<void> _onFetched(
    MediaFetched event,
    Emitter<MediaState> emit,
  ) async {}

  Future<void> _onListFetched(
    MediasListFetched event,
    Emitter<MediaState> emit,
  ) async {}
}
