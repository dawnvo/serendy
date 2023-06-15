import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/_mock.dart';
import 'package:serendy/core/assert.dart';
import 'package:serendy/features/evaluation/data/evaluation_repository.dart';
import 'package:serendy/features/evaluation/domain/evaluation.dart';
import 'package:serendy/features/media/domain/media.dart';
import 'package:serendy/features/user/domain/user.dart';

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

  static const _executorId = 'uid';

  /// Get evaluation
  ///
  /// 1. 평가를 조회해요.
  /// 2. 평가가 없거나, 제거한 평가라면 종료해요.
  /// 3. 상태를 갱신해요.🔥
  Future<void> _onFetched(
    EvaluationFetched event,
    Emitter<EvaluationState> emit,
  ) async {
    try {
      // [1]
      final evaluation =
          await evaluationRepository.fetchEvaluation(event.userId);

      // [2]
      if (evaluation == null || evaluation.removedAt != null) {
        emit(const EvaluationEmpty());
        return;
      }

      // [3]
      emit(EvaluationLoaded(evaluation: evaluation));
    } catch (err) {
      emit(EvaluationError(err.toString()));
    }
  }

  /// Get evaluation list
  ///
  /// 1. 평가를 조회해요.
  /// -. 제거한 평가는 조회하지 않아요.
  /// -. 비공개 평가는 소유자만 조회할 수 있어요.
  /// 2. 상태를 갱신해요.🔥
  Future<void> _onListFetched(
    EvaluationsListFetched event,
    Emitter<EvaluationState> emit,
  ) async {
    try {
      // [1]
      final evaluations = await evaluationRepository.fetchEvaluationList();

      // [2]
      emit(EvaluationsListLoaded(evaluations: evaluations));
    } catch (err) {
      emit(EvaluationError(err.toString()));
    }
  }

  /// Create evaluation
  ///
  /// 1. 사용자가 존재하는지 확인해요.
  /// 2. 미디어가 존재하는지 확인해요.
  /// 3. 평가를 생성해요.
  /// 4. 상태를 갱신해요.🔥
  Future<void> _onCreated(
    EvaluationCreated event,
    Emitter<EvaluationState> emit,
  ) async {
    try {
      // [1]
      final user = CoreAssert.notEmpty<User>(
        userMock,
        Exception("사용자를 찾을 수 없어요."),
      );

      // [2]
      final media = CoreAssert.notEmpty<Media>(
        mediaMock,
        Exception("미디어를 찾을 수 없어요."),
      );

      // [3]
      final evaluation = Evaluation(
        media: MediaItem(
          id: media.id,
          title: media.title,
          image: media.image,
        ),
        userId: user.id,
        emotion: event.emotion,
      );

      await evaluationRepository.createEvaluation(evaluation);

      // [4]
      emit(EvaluationLoaded(evaluation: evaluation));
    } catch (err) {
      emit(EvaluationError(err.toString()));
    }
  }

  /// Update evaluation
  ///
  /// 1. 평가가 존재하는지 확인해요.
  /// 2. 평가가 없으면 종료해요.🔥
  /// 3. 올바른 실행자인지 확인해요.
  /// 4. 감정을 변경해요.
  /// 5. 평가를 제거했었으면 복구해요.
  /// 6. 상태를 갱신해요.🔥
  Future<void> _onUpdated(
    EvaluationUpdated event,
    Emitter<EvaluationState> emit,
  ) async {
    try {
      // [1]
      final evaluation =
          await evaluationRepository.fetchEvaluation(_executorId);

      // [2]
      if (evaluation == null) {
        emit(const EvaluationEmpty());
        return;
      }

      // [3]
      final hasAccess = _executorId == evaluation.userId;
      CoreAssert.isTrue(hasAccess, Exception('접근 권한이 없어요.'));

      // [4]
      Evaluation changed = evaluation.changeEmotion(event.emotion);

      // [5]
      if (evaluation.removedAt != null) {
        changed = changed.restore();
      }

      await evaluationRepository.updateEvaluation(changed);

      // [6]
      emit(EvaluationLoaded(evaluation: changed));
    } catch (err) {
      emit(EvaluationError(err.toString()));
    }
  }

  /// Remove evaluation
  ///
  /// 1. 평가가 존재하는지 확인해요.
  /// 2. 올바른 실행자인지 확인해요.
  /// 3. 평가를 제거해요.
  /// 4. 상태를 갱신해요.🔥
  Future<void> _onRemoved(
    EvaluationRemoved event,
    Emitter<EvaluationState> emit,
  ) async {
    try {
      // [1]
      final evaluation = CoreAssert.notEmpty(
        await evaluationRepository.fetchEvaluation(_executorId),
        Exception("평가를 찾을 수 없어요."),
      );

      // [2]
      final hasAccess = _executorId == evaluation.userId;
      CoreAssert.isTrue(hasAccess, Exception('접근 권한이 없어요.'));

      // [3]
      final removed = evaluation.remove();
      await evaluationRepository.updateEvaluation(removed);

      // [4]
      emit(const EvaluationEmpty());
    } catch (err) {
      emit(EvaluationError(err.toString()));
    }
  }
}
