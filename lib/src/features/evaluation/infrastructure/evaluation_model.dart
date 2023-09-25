import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/core/infrastructure/serializable.dart';
import 'package:serendy/src/features/user/user.dart';

part 'evaluation_model.g.dart';

@jsonSerializable
final class EvaluationModel {
  const EvaluationModel({
    required this.id,
    required this.userId,
    required this.emotion,
    required this.media,
    required this.private,
    required this.createdAt,
    required this.updatedAt,
    this.removedAt,
  });

  final String id;
  final UserID userId;
  final Emotion emotion;
  final EvaluationMediaModel media;
  final bool private;

  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? removedAt;

  factory EvaluationModel.fromJson(Map<String, dynamic> json) =>
      _$EvaluationModelFromJson(json);
  Map<String, dynamic> toJson() => _$EvaluationModelToJson(this);
}

@jsonSerializable
final class EvaluationMediaModel {
  const EvaluationMediaModel({
    required this.id,
    required this.title,
    required this.image,
  });

  final String id;
  final String title;
  final String image;

  factory EvaluationMediaModel.fromJson(Map<String, dynamic> json) =>
      _$EvaluationMediaModelFromJson(json);
  Map<String, dynamic> toJson() => _$EvaluationMediaModelToJson(this);
}
