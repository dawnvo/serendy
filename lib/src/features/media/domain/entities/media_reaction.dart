part of 'media.dart';

//Value-Object
final class MediaReaction extends Equatable {
  /// 감정
  final Emotion emotion;

  /// 개수
  final int count;

  const MediaReaction({
    required this.emotion,
    required this.count,
  });

  @override
  List<Object?> get props => [emotion];
}
