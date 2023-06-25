part of 'media_controller.dart';

class MediaState extends Equatable {
  const MediaState({
    required this.media,
    required this.reactions,
  });

  final Media media;
  final List<Evaluation?> reactions;

  @override
  List<Object?> get props => [
        media,
        reactions,
      ];
}
