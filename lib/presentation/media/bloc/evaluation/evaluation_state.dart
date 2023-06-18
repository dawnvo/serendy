part of 'evaluation_bloc.dart';

enum EvaluationStatus { initial, loading, success, failure }

final class EvaluationState extends Equatable {
  const EvaluationState({
    this.status = EvaluationStatus.initial,
    this.evaluation,
    this.errorMessage,
  });

  final EvaluationStatus status;
  final Evaluation? evaluation;
  final String? errorMessage;

  EvaluationState copyWith({
    final EvaluationStatus? status,
    final Evaluation? evaluation,
    final String? errorMessage,
  }) {
    return EvaluationState(
      status: status ?? this.status,
      evaluation: evaluation ?? this.evaluation,
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
