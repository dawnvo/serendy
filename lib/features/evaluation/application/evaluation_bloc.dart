import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/_mock.dart';
import 'package:serendy/core/assert.dart';
import 'package:serendy/features/evaluation/data/evaluation_repository.dart';
import 'package:serendy/features/evaluation/domain/evaluation.dart';

part 'evaluation_event.dart';
part 'evaluation_state.dart';

class EvaluationBloc extends Bloc<EvaluationEvent, EvaluationState> {
  EvaluationBloc({required this.evaluationRepository})
      : super(const EvaluationLoading()) {
    on<EvaluationFetched>(_onFetched);
    on<EvaluationsListFetched>(_onListFetched);
    on<EvaluationCreated>(_onCreated);
    on<EvaluationUpdated>(_onUpdated);
    on<EvaluationRemoved>(_onRemoved);
  }

  final EvaluationRepository evaluationRepository;

  Future<void> _onFetched(
    EvaluationFetched event,
    Emitter<EvaluationState> emit,
  ) async {
    try {
      final evaluation =
          await evaluationRepository.fetchEvaluation(event.userId);

      if (evaluation == null) {
        emit(const EvaluationEmpty());
        return;
      }

      emit(EvaluationLoaded(evaluation: evaluation));
    } catch (err) {
      emit(EvaluationError(err.toString()));
    }
  }

  Future<void> _onListFetched(
    EvaluationsListFetched event,
    Emitter<EvaluationState> emit,
  ) async {
    try {
      final evaluations = await evaluationRepository.fetchEvaluationList();
      emit(EvaluationsListLoaded(evaluations: evaluations));
    } catch (err) {
      emit(EvaluationError(err.toString()));
    }
  }

  Future<void> _onCreated(
    EvaluationCreated event,
    Emitter<EvaluationState> emit,
  ) async {
    final user = userMock;
    final media = mediaMock;

    final evaluation = Evaluation(
      media: MediaItem(
        id: media.id,
        title: media.title,
        image: media.image,
      ),
      userId: user.id,
      emotion: event.emotion,
    );

    try {
      await evaluationRepository.createEvaluation(evaluation);
      emit(EvaluationLoaded(evaluation: evaluation));
    } catch (err) {
      emit(EvaluationError(err.toString()));
    }
  }

  Future<void> _onUpdated(
    EvaluationUpdated event,
    Emitter<EvaluationState> emit,
  ) async {
    final user = userMock;

    try {
      final evaluation = CoreAssert.notEmpty(
        await evaluationRepository.fetchEvaluation(user.id),
        Exception("평가를 찾을 수 없어요."),
      );

      final changed = evaluation.changeEmotion(event.emotion);

      await evaluationRepository.updateEvaluation(changed);
      emit(EvaluationLoaded(evaluation: changed));
    } catch (err) {
      emit(EvaluationError(err.toString()));
    }
  }

  Future<void> _onRemoved(
    EvaluationRemoved event,
    Emitter<EvaluationState> emit,
  ) async {
    final user = userMock;

    try {
      final evaluation = CoreAssert.notEmpty(
        await evaluationRepository.fetchEvaluation(user.id),
        Exception("평가를 찾을 수 없어요."),
      );

      final removed = evaluation.remove();

      await evaluationRepository.updateEvaluation(removed);
      emit(const EvaluationEmpty());
    } catch (err) {
      emit(EvaluationError(err.toString()));
    }
  }
}
