import 'package:flutter/widgets.dart';
import 'package:serendy/src/models/models.dart';

extension EmotionX on Emotion {
  String get filePath => 'assets/emotions/$name.svg';

  String get label => switch (this) {
        Emotion.nice => '멋져요',
        Emotion.joy => '재밌어요',
        Emotion.happyness => '행복해요',
        Emotion.surprise => '놀라워요',
        Emotion.sadness => '슬퍼요',
        Emotion.fear => '무서워요',
        Emotion.normal => '괜찮아요',
        Emotion.disgust => '별로예요',
        Emotion.anger => '화나요',
      };

  Color get color => switch (this) {
        Emotion.nice => const Color(0xFFFFC9B9),
        Emotion.joy => const Color(0xFFFFF3B0),
        Emotion.happyness => const Color(0xFFF7D6E0),
        Emotion.surprise => const Color(0xFFCAE7F9),
        Emotion.sadness => const Color(0xFFA0C4FA),
        Emotion.fear => const Color(0xFFE9E0F9),
        Emotion.normal => const Color(0xFFEFF2F5),
        Emotion.disgust => const Color(0xFFC4B3F4),
        Emotion.anger => const Color(0xFFF48B9B),
      };
}
