part of 'media_bloc.dart';

sealed class MediaEvent extends Equatable {
  const MediaEvent();
}

final class Media$Fetched extends MediaEvent {
  const Media$Fetched({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}
