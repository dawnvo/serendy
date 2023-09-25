// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Evaluation _$EvaluationFromJson(Map<String, dynamic> json) => Evaluation(
      id: json['id'] as String,
      userId: json['userId'] as String,
      media: EvaluationMedia.fromJson(json['media'] as Map<String, dynamic>),
      emotion: $enumDecode(_$EmotionEnumMap, json['emotion']),
    );

Map<String, dynamic> _$EvaluationToJson(Evaluation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'media': instance.media,
      'emotion': _$EmotionEnumMap[instance.emotion]!,
    };

const _$EmotionEnumMap = {
  Emotion.nice: 'nice',
  Emotion.joy: 'joy',
  Emotion.happyness: 'happyness',
  Emotion.surprise: 'surprise',
  Emotion.sadness: 'sadness',
  Emotion.fear: 'fear',
  Emotion.normal: 'normal',
  Emotion.disgust: 'disgust',
  Emotion.anger: 'anger',
};

EvaluationMedia _$EvaluationMediaFromJson(Map<String, dynamic> json) =>
    EvaluationMedia(
      id: json['id'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$EvaluationMediaToJson(EvaluationMedia instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
    };
