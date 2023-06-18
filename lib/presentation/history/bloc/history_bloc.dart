import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/features/evaluation/data/evaluation_repository.dart';
import 'package:serendy/features/evaluation/domain/evaluation.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc({required this.evaluationRepository})
      : super(const HistoryState()) {
    on<History$MyEvaluationsFetched>(_onMyEvaluationsFetched);
  }

  final EvaluationRepository evaluationRepository;

  Future<void> _onMyEvaluationsFetched(
    History$MyEvaluationsFetched event,
    Emitter<HistoryState> emit,
  ) async {
    emit(state.copyWith(status: HistoryStatus.loading));

    try {
      final evaluations = await evaluationRepository
          .fetchEvaluationList('01H32VTAB65FMME5N8HMDT70GY');

      emit(state.copyWith(
        status: HistoryStatus.success,
        evaluations: evaluations,
      ));
    } catch (err) {
      emit(state.copyWith(
        status: HistoryStatus.failure,
        errorMessage: err.toString(),
      ));
    }
  }
}
