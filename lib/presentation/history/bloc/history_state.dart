part of 'history_bloc.dart';

enum HistoryStatus { initial, loading, success, failure }

final class HistoryState extends Equatable {
  const HistoryState({
    this.status = HistoryStatus.initial,
    this.evaluations = const [],
    this.errorMessage,
  });

  final HistoryStatus status;
  final List<Evaluation?> evaluations;
  final String? errorMessage;

  HistoryState copyWith({
    final HistoryStatus? status,
    final List<Evaluation?>? evaluations,
    final String? errorMessage,
  }) {
    return HistoryState(
      status: status ?? this.status,
      evaluations: evaluations ?? this.evaluations,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        evaluations,
        errorMessage,
      ];
}
