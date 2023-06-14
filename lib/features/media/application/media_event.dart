part of 'media_bloc.dart';

sealed class MediaEvent extends Equatable {
  const MediaEvent();
}

/// GET MEDIA
final class MediaFetched extends MediaEvent {
  const MediaFetched({required this.id});

  final String id;

  @override
  List<Object> get props => [];
}

/// GET MEDIAS
final class MediasListFetched extends MediaEvent {
  const MediasListFetched();

  @override
  List<Object> get props => [];
}
