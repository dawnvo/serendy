import 'package:ulid/ulid.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/profile/profile.dart';

part 'evaluation_media.dart';

//Identity
typedef EvaluationID = String;

//Enums
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

//AggregateRoot
final class Evaluation extends Equatable {
  final EvaluationID id;

  /// 평가한 작품
  final EvaluationMedia media;

  /// 평가한 사용자
  final UserID userId;

  /// 감정 평가
  final Emotion emotion;

  /// 생성 날짜
  final DateTime createdAt;

  /// 수정 날짜
  final DateTime updatedAt;

  /// 제거 날짜
  final DateTime? removedAt;

  Evaluation({
    required this.media,
    required this.userId,
    required this.emotion,
    this.removedAt,
    final String? id,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  })  : id = id ?? Ulid().toString(),
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  @override
  List<Object?> get props => [id, emotion];
}

extension EvaluationX on Evaluation {
  /// 감정 변경
  Evaluation changeEmotion(Emotion emotion) {
    return copy(
      emotion: emotion,
      updatedAt: DateTime.now(),
    );
  }

  /// 평가 제거
  Evaluation remove() {
    return copy(removedAt: DateTime.now());
  }

  /// 평가 복구
  Evaluation restore() {
    return copy(
      createdAt: DateTime.now(),
      removedAt: null,
    );
  }

  // 평가 복사
  Evaluation copy({
    final EvaluationID? id,
    final EvaluationMedia? media,
    final UserID? userId,
    final Emotion? emotion,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final DateTime? removedAt,
  }) {
    return Evaluation(
      id: id ?? this.id,
      media: media ?? this.media,
      userId: userId ?? this.userId,
      emotion: emotion ?? this.emotion,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      removedAt: removedAt,
    );
  }
}
