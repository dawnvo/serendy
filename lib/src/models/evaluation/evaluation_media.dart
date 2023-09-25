part of 'evaluation.dart';

//Entity
@JsonSerializable()
final class EvaluationMedia extends Equatable {
  final MediaID id;

  // * 제목
  final String title;

  // * 이미지
  final String image;

  const EvaluationMedia({
    required this.id,
    required this.title,
    required this.image,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        image,
      ];

  Media get convertEntity => Media(
        id: id,
        title: title,
        image: image,
        //dummy
        keywords: const [],
        type: MediaType.anime,
        status: MediaStatus.finished,
      );

  factory EvaluationMedia.fromJson(Json json) =>
      _$EvaluationMediaFromJson(json);
  Json toJson() => _$EvaluationMediaToJson(this);
}
