part of 'media_controller.dart';

final class MediaState extends Equatable {
  const MediaState({
    required this.media,
    required this.reactions,
  });

  final Media media;
  final List<MediaReaction?> reactions;

  @override
  List<Object?> get props => [
        media,
        reactions,
      ];
}
