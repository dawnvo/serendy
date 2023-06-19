import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/features/evaluation/data/evaluation_repository.dart';
import 'package:serendy/features/evaluation/domain/evaluation.dart';

part 'my_evaluation_event.dart';
part 'my_evaluation_state.dart';

class MyEvaluationBloc extends Bloc<MyEvaluationEvent, MyEvaluationState> {
  MyEvaluationBloc({required this.evaluationRepository})
      : super(const MyEvaluationState()) {
    on<MyEvaluation$Fetched>(_onFetched);
    on<MyEvaluation$Evaluated>(_onEvaluated);
    on<MyEvaluation$Removed>(_onRemoved);
  }

  final EvaluationRepository evaluationRepository;

  Future<void> _onFetched(
    MyEvaluation$Fetched event,
    Emitter<MyEvaluationState> emit,
  ) async {
    emit(state.copyWith(status: MyEvaluationStatus.loading));

    try {
      final evaluation =
          await evaluationRepository.fetchEvaluation(event.mediaId);

      emit(state.copyWith(
        status: MyEvaluationStatus.success,
        evaluation: evaluation,
      ));
    } catch (err) {
      emit(state.copyWith(
        status: MyEvaluationStatus.failure,
        errorMessage: err.toString(),
      ));
    }
  }

  Future<void> _onEvaluated(
    MyEvaluation$Evaluated event,
    Emitter<MyEvaluationState> emit,
  ) async {
    try {
      final evaluation = await evaluationRepository.evaluate(
        event.mediaId,
        event.emotion,
      );

      emit(state.copyWith(
        status: MyEvaluationStatus.success,
        evaluation: evaluation,
      ));
    } catch (err) {
      emit(state.copyWith(
        status: MyEvaluationStatus.failure,
        errorMessage: err.toString(),
      ));
    }
  }

  Future<void> _onRemoved(
    MyEvaluation$Removed event,
    Emitter<MyEvaluationState> emit,
  ) async {
    try {
      await evaluationRepository.removeEvaluation(event.mediaId);

      emit(const MyEvaluationState(
        status: MyEvaluationStatus.success,
        evaluation: null,
      ));
    } catch (err) {
      emit(state.copyWith(
        status: MyEvaluationStatus.failure,
        errorMessage: err.toString(),
      ));
    }
  }
}
