part of 'exit_controller.dart';

enum Reason {
  inconvenience,
  absence,
  security,
  alternative,
  infrequency,
  other,
}

extension ReasonX on Reason {
  String get label => switch (this) {
        Reason.inconvenience => '서비스 이용이 불편해요.',
        Reason.absence => '원하는 기능 또는 콘텐츠가 부재해요.',
        Reason.security => '보안 및 개인정보가 걱정돼요.',
        Reason.alternative => '다른 서비스를 이용하고 있어요.',
        Reason.infrequency => '사용 빈도가 낮아요.',
        Reason.other => '기타',
      };
}

final class ExitState extends Equatable {
  const ExitState({
    required this.username,
    this.reason,
    this.comment,
  });

  final String? username;
  final Reason? reason;
  final String? comment;

  ExitState copyWith({
    final String? username,
    final Reason? reason,
    final String? comment,
  }) {
    return ExitState(
      username: username ?? this.username,
      reason: reason ?? this.reason,
      comment: comment ?? this.comment,
    );
  }

  @override
  List<Object?> get props => [
        username,
        reason,
        comment,
      ];
}
