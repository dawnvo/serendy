part of 'evaluate_media_controller.dart';

enum EvaluateMediaStatus { initial, success, failure }

class EvaluateMediaState extends Equatable {
  const EvaluateMediaState({
    this.status = EvaluateMediaStatus.initial,
    required this.evaluation,
    this.errorMessage,
  });

  final EvaluateMediaStatus status;
  final Evaluation? evaluation;
  final String? errorMessage;

  EvaluateMediaState copyWith({
    final EvaluateMediaStatus? status,
    final Evaluation? evaluation,
    final String? errorMessage,
  }) {
    return EvaluateMediaState(
      status: status ?? this.status,
      // null 값을 의도적으로 넘기기 위해 조건문을 사용했어요.
      evaluation: evaluation != this.evaluation ? evaluation : this.evaluation,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        evaluation,
        errorMessage,
      ];
}
