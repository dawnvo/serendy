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
