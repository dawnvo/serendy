part of 'evaluation_bloc.dart';

sealed class EvaluationEvent extends Equatable {
  const EvaluationEvent();
}

final class Evaluation$Fetched extends EvaluationEvent {
  const Evaluation$Fetched({required this.mediaId});
  final String mediaId;

  @override
  List<Object> get props => [mediaId];
}

final class Evaluation$Evaluated extends EvaluationEvent {
  const Evaluation$Evaluated({
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

final class Evaluation$Removed extends EvaluationEvent {
  const Evaluation$Removed({required this.mediaId});
  final String mediaId;

  @override
  List<Object> get props => [mediaId];
}
