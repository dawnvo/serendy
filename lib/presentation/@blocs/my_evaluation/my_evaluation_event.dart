part of 'my_evaluation_bloc.dart';

sealed class MyEvaluationEvent extends Equatable {
  const MyEvaluationEvent();
}

final class MyEvaluation$Fetched extends MyEvaluationEvent {
  const MyEvaluation$Fetched();

  @override
  List<Object> get props => [];
}

final class MyEvaluation$Evaluated extends MyEvaluationEvent {
  const MyEvaluation$Evaluated({required this.emotion});
  final Emotion emotion;

  @override
  List<Object> get props => [emotion];
}

final class MyEvaluation$Removed extends MyEvaluationEvent {
  const MyEvaluation$Removed();

  @override
  List<Object> get props => [];
}
