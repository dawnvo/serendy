part of 'evaluation.dart';

//entity
final class EvaluationMedia extends Equatable {
  final MediaID id;

  /// 작품 제목
  final String title;

  /// 작품 이미지
  final String image;

  const EvaluationMedia({
    required this.id,
    required this.title,
    required this.image,
  });

  @override
  List<Object?> get props => [id];

  Media get convertEntity => Media(
        id: id,
        title: title,
        image: image,
        thumbnail: image,
        keywords: const [],
        type: MediaType.tv,
        status: MediaStatus.finished,
      );
}
