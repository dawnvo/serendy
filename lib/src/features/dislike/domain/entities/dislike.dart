import 'package:equatable/equatable.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';

//AggregateRoot
final class Dislike extends Equatable {
  /// 사용자 식별
  final UserID userId;

  /// 작품 식별
  final MediaID mediaId;

  /// 추가한 날짜
  final DateTime addedAt;

  Dislike({
    required this.userId,
    required this.mediaId,
    final DateTime? addedAt,
  }) : addedAt = addedAt ?? DateTime.now();

  @override
  List<Object?> get props => [
        userId,
        mediaId,
      ];
}

extension DislikeX on Dislike {
  // 관심없음 복사
  Dislike copy({
    final UserID? userId,
    final MediaID? mediaId,
    final DateTime? addedAt,
  }) {
    return Dislike(
      userId: userId ?? this.userId,
      mediaId: mediaId ?? this.mediaId,
      addedAt: addedAt ?? this.addedAt,
    );
  }
}
