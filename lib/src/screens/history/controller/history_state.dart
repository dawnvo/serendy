part of 'history_controller.dart';

final class HistoryState extends Equatable {
  const HistoryState({
    this.evaluationsCount = 0,
    this.evaluations = const [],
    this.page = 0,
    this.isCompleted = false,
  });

  final int evaluationsCount;
  final List<Evaluation?> evaluations;
  final int page;
  final bool isCompleted;

  HistoryState copyWith({
    final int? evaluationsCount,
    final int? page,
    final List<Evaluation?>? evaluations,
    final bool? isCompleted,
  }) {
    return HistoryState(
      evaluationsCount: evaluationsCount ?? this.evaluationsCount,
      evaluations: evaluations ?? this.evaluations,
      page: page ?? this.page,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [
        evaluationsCount,
        evaluations,
        page,
      ];
}
