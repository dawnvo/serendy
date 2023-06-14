import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
  ) async {}

  Future<void> _onListFetched(
    EvaluationsListFetched event,
    Emitter<EvaluationState> emit,
  ) async {}

  Future<void> _onCreated(
    EvaluationCreated event,
    Emitter<EvaluationState> emit,
  ) async {}

  Future<void> _onUpdated(
    EvaluationUpdated event,
    Emitter<EvaluationState> emit,
  ) async {}

  Future<void> _onRemoved(
    EvaluationRemoved event,
    Emitter<EvaluationState> emit,
  ) async {}
}
