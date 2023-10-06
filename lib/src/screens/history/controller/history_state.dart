part of 'history_controller.dart';

final class HistoryState extends Equatable {
  const HistoryState({
    required this.evaluationsCount,
    required this.evaluations,
  });

  final int evaluationsCount;
  final List<Evaluation?> evaluations;

  @override
  List<Object?> get props => [
        evaluationsCount,
        evaluations,
      ];
}
