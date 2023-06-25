part of 'history_controller.dart';

final class HistoryState extends Equatable {
  const HistoryState({this.evaluations = const []});

  final List<Evaluation?> evaluations;

  HistoryState copyWith({final List<Evaluation?>? evaluations}) {
    return HistoryState(evaluations: evaluations ?? this.evaluations);
  }

  @override
  List<Object?> get props => [evaluations];
}
