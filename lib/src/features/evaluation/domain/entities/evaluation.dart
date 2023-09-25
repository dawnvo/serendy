import 'package:ulid/ulid.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';

part 'evaluation_media.dart';

typedef EvaluationID = String;

/// [AggregateRoot]
final class Evaluation extends Equatable {
  final EvaluationID id;

  /// 평가한 사용자
  final UserID userId;

  /// 평가한 미디어
  final EvaluationMedia media;

  /// 감정 평가
  final Emotion emotion;

  /// 비공개 상태
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

  // ☹️ Boilerplate Code
  Evaluation copy({
    final EvaluationID? id,
    final UserID? userId,
    final bool? private,
    final Emotion? emotion,
    final EvaluationMedia? media,
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
}
