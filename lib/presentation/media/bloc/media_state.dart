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

/// LOADED
final class MediaLoaded extends MediaState {
  const MediaLoaded({required this.media});
  final Media media;

  @override
  List<Object?> get props => [media];
}

/// ERROR
final class MediaError extends MediaState {
  const MediaError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
