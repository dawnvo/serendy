part of 'my_evaluation_bloc.dart';

enum MyEvaluationStatus { initial, loading, success, failure }

final class MyEvaluationState extends Equatable {
  const MyEvaluationState({
    this.status = MyEvaluationStatus.initial,
    this.evaluation,
    this.errorMessage,
  });

  final MyEvaluationStatus status;
  final Evaluation? evaluation;
  final String? errorMessage;

  MyEvaluationState copyWith({
    final MyEvaluationStatus? status,
    final Evaluation? evaluation,
    final String? errorMessage,
  }) {
    return MyEvaluationState(
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
