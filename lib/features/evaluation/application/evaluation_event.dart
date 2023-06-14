part of 'evaluation_bloc.dart';

sealed class EvaluationEvent extends Equatable {
  const EvaluationEvent();
}

/// GET EVALUATION
final class EvaluationFetched extends EvaluationEvent {
  const EvaluationFetched({required this.userId});

  final String userId;

  @override
  List<Object> get props => [];
}

/// GET EVALUATIONS
final class EvaluationsListFetched extends EvaluationEvent {
  const EvaluationsListFetched({required this.userId});

  final String userId;

  @override
  List<Object> get props => [];
}

/// CREATE EVALUATION
final class EvaluationCreated extends EvaluationEvent {
  const EvaluationCreated();

  @override
  List<Object> get props => [];
}

/// UPDATE EVALUATION
final class EvaluationUpdated extends EvaluationEvent {
  const EvaluationUpdated();

  @override
  List<Object> get props => [];
}

/// REMOVE EVALUATION
final class EvaluationRemoved extends EvaluationEvent {
  const EvaluationRemoved();

  @override
  List<Object> get props => [];
}
