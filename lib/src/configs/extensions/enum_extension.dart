import 'package:flutter/widgets.dart';
import 'package:serendy/src/core/enums.dart';

extension MediaStatusX on MediaStatus {
  String get label => switch (this) {
        MediaStatus.finished => '완결',
        MediaStatus.releasing => '방영 중',
        MediaStatus.unreleased => '방영 전',
        MediaStatus.cancelled => '방영 취소',
      };
}

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
        Emotion.anger => '싫어요',
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

extension RankX on Rank {
  String get filePath => 'assets/ranks/$name.svg';

  String get label => switch (this) {
        Rank.iron => '아이언',
        Rank.bronze => '브론즈',
        Rank.silver => '실버',
        Rank.gold => '골드',
        Rank.platinum => '플래티넘',
        Rank.diamond => '다이아몬드',
        Rank.master => '마스터',
        Rank.novel => '노벨',
      };

  ({int min, int max}) get range => switch (this) {
        Rank.iron => const (min: 0, max: 10),
        Rank.bronze => const (min: 10, max: 20),
        Rank.silver => const (min: 20, max: 50),
        Rank.gold => const (min: 50, max: 100),
        Rank.platinum => const (min: 100, max: 200),
        Rank.diamond => const (min: 200, max: 500),
        Rank.master => const (min: 500, max: 1000),
        Rank.novel => const (min: 1000, max: 0),
      };

  ({Color fore, Color back}) get color => switch (this) {
        Rank.iron => const (
            fore: Color(0xFF8C8C97),
            back: Color(0xFF191921),
          ),
        Rank.bronze => const (
            fore: Color(0xFFE8CBA4),
            back: Color(0xFF564226),
          ),
        Rank.silver => const (
            fore: Color(0xFFF1F4F5),
            back: Color(0xFF4B5559),
          ),
        Rank.gold => const (
            fore: Color(0xFFFFD971),
            back: Color(0xFF604312),
          ),
        Rank.platinum => const (
            fore: Color(0xFF9DF0F3),
            back: Color(0xFF245455),
          ),
        Rank.diamond => const (
            fore: Color(0xFFB9CAF5),
            back: Color(0xFF364262),
          ),
        Rank.master => const (
            fore: Color(0xFFD8B8F5),
            back: Color(0xFF4C3662),
          ),
        Rank.novel => const (
            fore: Color(0xFFFD6AA8),
            back: Color(0xFF5A1637),
          ),
      };
}
