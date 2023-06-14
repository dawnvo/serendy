part of 'media_bloc.dart';

sealed class MediaState extends Equatable {
  const MediaState();
}

/// LOADING
final class MediaLoading extends MediaState {
  const MediaLoading();

  @override
  List<Object?> get props => [];
}

/// LOADED MEDIA
final class MediaLoaded extends MediaState {
  const MediaLoaded({required this.media});
  final Media media;

  @override
  List<Object?> get props => [media];
}

/// LOADED MEDIAS
final class MediasListLoaded extends MediaState {
  const MediasListLoaded({required this.medias});
  final List<Media> medias;

  @override
  List<Object?> get props => [medias];
}

/// ERROR
final class MediaError extends MediaState {
  const MediaError({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
