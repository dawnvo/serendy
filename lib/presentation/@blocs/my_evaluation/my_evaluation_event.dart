part of 'my_evaluation_bloc.dart';

sealed class MyEvaluationEvent extends Equatable {
  const MyEvaluationEvent();
}

final class MyEvaluation$Fetched extends MyEvaluationEvent {
  const MyEvaluation$Fetched({required this.mediaId});
  final String mediaId;

  @override
  List<Object> get props => [mediaId];
}

final class MyEvaluation$Evaluated extends MyEvaluationEvent {
  const MyEvaluation$Evaluated({
    required this.mediaId,
    required this.emotion,
  });

  final String mediaId;
  final Emotion emotion;

  @override
  List<Object> get props => [
        mediaId,
        emotion,
      ];
}

final class MyEvaluation$Removed extends MyEvaluationEvent {
  const MyEvaluation$Removed({required this.mediaId});
  final String mediaId;

  @override
  List<Object> get props => [mediaId];
}
