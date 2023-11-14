import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';

//media-status
extension MediaStatusX on MediaStatus {
  String get label => switch (this) {
        MediaStatus.finished => '완결',
        MediaStatus.releasing => '방영 중',
        MediaStatus.upcoming => '방영 예정',
        MediaStatus.cancelled => '방영 취소',
        MediaStatus.hiatus => '방영 휴재',
      };
}

//emotion
extension EmotionX on Emotion {
  String get filePath => '${Assets.iconPath}/emotions/$name.svg';

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

//rank
extension RankX on Rank {
  String get filePath => '${Assets.iconPath}/ranks/$name.svg';

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

  Color get color => switch (this) {
        Rank.iron => const Color(0xFF8C8C97),
        Rank.bronze => const Color(0xFFE8CBA4),
        Rank.silver => const Color(0xFFF1F4F5),
        Rank.gold => const Color(0xFFFFD971),
        Rank.platinum => const Color(0xFF9DF0F3),
        Rank.diamond => const Color(0xFFB9CAF5),
        Rank.master => const Color(0xFFD8B8F5),
        Rank.novel => const Color(0xFFFD6AA8),
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
}

//exit-reason
extension ExitReasonX on ExitReason {
  String get label => switch (this) {
        ExitReason.inconvenience => '서비스 이용이 불편해요.',
        ExitReason.absence => '원하는 기능 또는 콘텐츠가 부재해요.',
        ExitReason.security => '보안 및 개인정보가 걱정돼요.',
        ExitReason.alternative => '다른 서비스를 이용하고 있어요.',
        ExitReason.infrequency => '사용 빈도가 낮아요.',
        ExitReason.other => '기타',
      };
}
