import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/core/types.dart';
import 'package:serendy/src/models/media/media.dart';
import 'package:serendy/src/models/user/user.dart';

part 'evaluation.g.dart';
part 'evaluation_media.dart';

typedef EvaluationID = String;

//AggregateRoot
@JsonSerializable()
final class Evaluation extends Equatable {
  final EvaluationID id;

  // * 평가한 사용자
  final UserID userId;

  // * 평가한 미디어
  final EvaluationMedia media;

  // * 감정 평가
  final Emotion emotion;

  const Evaluation({
    required this.id,
    required this.userId,
    required this.media,
    required this.emotion,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        media,
        emotion,
      ];

  factory Evaluation.fromJson(Json json) => _$EvaluationFromJson(json);
  Json toJson() => _$EvaluationToJson(this);
}

extension EvaluationX on Evaluation {
  Evaluation copy({
    final EvaluationID? id,
    final UserID? userId,
    final Emotion? emotion,
    final EvaluationMedia? media,
  }) {
    return Evaluation(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      emotion: emotion ?? this.emotion,
      media: media ?? this.media,
    );
  }
}
