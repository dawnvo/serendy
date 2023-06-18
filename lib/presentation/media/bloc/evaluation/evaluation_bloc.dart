import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/features/evaluation/data/evaluation_repository.dart';
import 'package:serendy/features/evaluation/domain/evaluation.dart';

part 'evaluation_event.dart';
part 'evaluation_state.dart';

class EvaluationBloc extends Bloc<EvaluationEvent, EvaluationState> {
  EvaluationBloc({required this.evaluationRepository})
      : super(const EvaluationState()) {
    on<Evaluation$Fetched>(_onFetched);
    on<Evaluation$Evaluated>(_onEvaluated);
    on<Evaluation$Removed>(_onRemoved);
  }

  final EvaluationRepository evaluationRepository;

  Future<void> _onFetched(
    Evaluation$Fetched event,
    Emitter<EvaluationState> emit,
  ) async {
    emit(state.copyWith(status: EvaluationStatus.loading));

    try {
      final evaluation =
          await evaluationRepository.fetchEvaluation(event.mediaId);

      emit(state.copyWith(
        status: EvaluationStatus.success,
        evaluation: evaluation,
      ));
    } catch (err) {
      emit(state.copyWith(
        status: EvaluationStatus.failure,
        errorMessage: err.toString(),
      ));
    }
  }

  Future<void> _onEvaluated(
    Evaluation$Evaluated event,
    Emitter<EvaluationState> emit,
  ) async {
    try {
      final evaluation = await evaluationRepository.evaluate(
        event.mediaId,
        event.emotion,
      );

      emit(state.copyWith(
        status: EvaluationStatus.success,
        evaluation: evaluation,
      ));
    } catch (err) {
      emit(state.copyWith(
        status: EvaluationStatus.failure,
        errorMessage: err.toString(),
      ));
    }
  }

  Future<void> _onRemoved(
    Evaluation$Removed event,
    Emitter<EvaluationState> emit,
  ) async {
    try {
      await evaluationRepository.removeEvaluation(event.mediaId);

      emit(const EvaluationState(
        status: EvaluationStatus.success,
        evaluation: null,
      ));
    } catch (err) {
      emit(state.copyWith(
        status: EvaluationStatus.failure,
        errorMessage: err.toString(),
      ));
    }
  }
}
