part of 'history_bloc.dart';

sealed class HistoryEvent extends Equatable {
  const HistoryEvent();
}

final class History$MyEvaluationsFetched extends HistoryEvent {
  const History$MyEvaluationsFetched();

  @override
  List<Object> get props => [];
}
