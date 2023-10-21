part of 'exit_controller.dart';

enum ExitStatus { initial, loading, success, failure }

final class ExitState extends Equatable {
  const ExitState({
    this.status = ExitStatus.initial,
    required this.username,
    this.reason,
    this.comment,
    this.errorMessage,
  });

  final ExitStatus status;
  final String? username;
  final ExitReason? reason;
  final String? comment;
  final String? errorMessage;

  ExitState copyWith({
    final ExitStatus? status,
    final String? username,
    final ExitReason? reason,
    final String? comment,
    final String? errorMessage,
  }) {
    return ExitState(
      status: status ?? this.status,
      username: username ?? this.username,
      reason: reason ?? this.reason,
      comment: comment ?? this.comment,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        username,
        reason,
        comment,
        errorMessage,
      ];
}
