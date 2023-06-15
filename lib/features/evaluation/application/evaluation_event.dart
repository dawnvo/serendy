part of 'evaluation_bloc.dart';

sealed class EvaluationEvent extends Equatable {
  const EvaluationEvent();
}

/// GET EVALUATION
final class EvaluationFetched extends EvaluationEvent {
  const EvaluationFetched({required this.userId});

  final String userId;

  @override
  List<Object> get props => [userId];
}

/// GET EVALUATIONS
final class EvaluationsListFetched extends EvaluationEvent {
  const EvaluationsListFetched({required this.userId});

  final String userId;

  @override
  List<Object> get props => [userId];
}

/// CREATE EVALUATION
final class EvaluationCreated extends EvaluationEvent {
  const EvaluationCreated({
    required this.mediaId,
    required this.emotion,
  });

  final String mediaId;
  final Emotion emotion;

  @override
  List<Object> get props => [mediaId, emotion];
}

/// UPDATE EVALUATION
final class EvaluationUpdated extends EvaluationEvent {
  const EvaluationUpdated({
    required this.mediaId,
    required this.emotion,
  });

  final String mediaId;
  final Emotion emotion;

  @override
  List<Object> get props => [mediaId, emotion];
}

/// REMOVE EVALUATION
final class EvaluationRemoved extends EvaluationEvent {
  const EvaluationRemoved({required this.mediaId});

  final String mediaId;

  @override
  List<Object> get props => [mediaId];
}
