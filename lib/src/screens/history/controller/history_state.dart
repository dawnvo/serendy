part of 'history_controller.dart';

final class HistoryState extends Equatable {
  const HistoryState({
    this.page = 0,
    this.evaluations = const [],
    this.evaluationsCount = 0,
  });

  final int page;
  final List<Evaluation?> evaluations;
  final int evaluationsCount;

  HistoryState copyWith({
    final int? page,
    final List<Evaluation?>? evaluations,
    final int? evaluationsCount,
  }) {
    return HistoryState(
      page: page ?? this.page,
      evaluations: evaluations ?? this.evaluations,
      evaluationsCount: evaluationsCount ?? this.evaluationsCount,
    );
  }

  @override
  List<Object?> get props => [
        page,
        evaluations,
        evaluationsCount,
      ];
}
