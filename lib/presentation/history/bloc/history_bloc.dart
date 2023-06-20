import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/features/evaluation/evaluation.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc({required this.evaluationService}) : super(const HistoryState()) {
    on<History$MyEvaluationsFetched>(_onMyEvaluationsFetched);
  }

  final EvaluationService evaluationService;

  Future<void> _onMyEvaluationsFetched(
    History$MyEvaluationsFetched event,
    Emitter<HistoryState> emit,
  ) async {
    emit(state.copyWith(status: HistoryStatus.loading));

    await emit.forEach(
      evaluationService.watchMyEvaluationsList(),
      onData: (evaluations) => state.copyWith(
        status: HistoryStatus.success,
        evaluations: evaluations,
      ),
      onError: (err, stack) => state.copyWith(
        status: HistoryStatus.failure,
        errorMessage: err.toString(),
      ),
    );
  }
}
