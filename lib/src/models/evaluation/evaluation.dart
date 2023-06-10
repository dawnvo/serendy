import 'package:ulid/ulid.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/src/models/models.dart';

part 'media_info.dart';

typedef EvaluationID = String;

enum Emotion {
  /* 분노 */ anger,
  /* 놀람 */ surprise,
  /* 슬픔 */ sadness,
  /* 별로 */ disgust,
  /* 보통 */ normal,
  /* 재미 */ joy,
  /* 공포 */ fear,
  /* 행복 */ happyness,
  /* 멋짐 */ nice,
}

/// [AggregateRoot]
final class Evaluation extends Equatable {
  /// 식별자
  final EvaluationID id;

  /// 사용자 식별
  final UserID userId;

  /// 감상한 미디어
  final MediaInfo media;

  /// 감상 후 느낀 감정
  final Emotion emotion;

  /// 공개 여부
  final bool private;

  /// 생성 날짜
  final DateTime createdAt;

  /// 수정 날짜
  final DateTime updatedAt;

  /// 제거 날짜
  final DateTime? removedAt;

  Evaluation({
    required this.userId,
    required this.media,
    required this.emotion,
    this.removedAt,
    final String? id,
    final bool? private,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  })  : id = id ?? Ulid().toString(),
        private = private ?? true,
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  // ☹️ Boilerplate Code
  Evaluation copyWith({
    final EvaluationID? id,
    final UserID? userId,
    final bool? private,
    final Emotion? emotion,
    final MediaInfo? media,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final DateTime? removedAt,
  }) {
    return Evaluation(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      media: media ?? this.media,
      emotion: emotion ?? this.emotion,
      private: private ?? this.private,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      removedAt: removedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        media,
        emotion,
        private,
        createdAt,
        updatedAt,
        removedAt,
      ];
}

extension EvaluationX on Evaluation {
  /// 감정 변경
  Evaluation changeEmotion(Emotion emotion) {
    return copyWith(
      emotion: emotion,
      updatedAt: DateTime.now(),
    );
  }

  /// 평가 제거
  Evaluation remove() {
    return copyWith(removedAt: DateTime.now());
  }

  /// 평가 복구
  Evaluation restore() {
    return copyWith(
      createdAt: DateTime.now(),
      removedAt: null,
    );
  }
}
