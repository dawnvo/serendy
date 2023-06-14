part of 'evaluation_bloc.dart';

sealed class EvaluationState extends Equatable {
  const EvaluationState();
}

/// LOADING
final class EvaluationLoading extends EvaluationState {
  const EvaluationLoading();

  @override
  List<Object?> get props => [];
}

/// LOADED EVALUATION
final class EvaluationLoaded extends EvaluationState {
  const EvaluationLoaded({required this.evaluation});
  final Evaluation evaluation;

  @override
  List<Object?> get props => [evaluation];
}

/// LOADED EVALUATIONS
final class EvaluationsListLoaded extends EvaluationState {
  const EvaluationsListLoaded({required this.evaluations});
  final List<Evaluation?> evaluations;

  @override
  List<Object?> get props => [evaluations];
}

/// EMPTY EVALUATION
final class EvaluationEmpty extends EvaluationState {
  const EvaluationEmpty();

  @override
  List<Object?> get props => [];
}

/// ERROR
final class EvaluationError extends EvaluationState {
  const EvaluationError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
