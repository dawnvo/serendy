import 'package:ulid/ulid.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/features/user/domain/user.dart';
import 'package:serendy/features/media/domain/media.dart';

enum Emotion {
  /* 멋짐 */ nice,
  /* 재미 */ joy,
  /* 행복 */ happyness,
  /* 놀람 */ surprise,
  /* 슬픔 */ sadness,
  /* 공포 */ fear,
  /* 보통 */ normal,
  /* 별로 */ disgust,
  /* 분노 */ anger,
}

typedef EvaluationID = String;

/// [AggregateRoot]
final class Evaluation extends Equatable {
  /// 식별자
  final EvaluationID id;

  /// 사용자 식별자
  final UserID userId;

  /// 감상한 미디어
  final Media media;

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
    final Media? media,
    final Emotion? emotion,
    final bool? private,
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
