import 'package:serendy/core/enums.dart';
import 'package:serendy/core/exceptions/core_exception.dart';
import 'package:serendy/features/auth/application/auth_service.dart';
import 'package:serendy/features/evaluation/domain/usecases/count_evaluations_usecase.dart';
import 'package:serendy/features/evaluation/domain/usecases/get_evaluation_list_usecase.dart';
import 'package:serendy/features/evaluation/domain/usecases/get_evaluation_usecase.dart';
import 'package:serendy/features/evaluation/domain/usecases/remove_evaluation_usecase.dart';
import 'package:serendy/features/evaluation/domain/usecases/submit_evaluation_usecase.dart';
import 'package:serendy/features/evaluation/domain/usecases/watch_evaluation_list_usecase.dart';
import 'package:serendy/features/evaluation/evaluation.dart';

class EvaluationService {
  const EvaluationService(
    this._authService,
    this._countEvaluationsUsecase,
    this._watchEvaluationListUsecase,
    this._getEvaluationListUsecase,
    this._getEvaluationUsecase,
    this._submitEvaluationUsecase,
    this._removeEvaluationUsecase,
  );

  final AuthService _authService;
  final WatchEvaluationListUsecase _watchEvaluationListUsecase;
  final GetEvaluationListUsecase _getEvaluationListUsecase;
  final GetEvaluationUsecase _getEvaluationUsecase;
  final CountEvaluationsUsecase _countEvaluationsUsecase;
  final SubmitEvaluationUsecase _submitEvaluationUsecase;
  final RemoveEvaluationUsecase _removeEvaluationUsecase;

  /// 미디어 반응 목록을 불러와요.
  Future<List<Evaluation?>> fetchReactionsList({
    required String mediaId,
  }) {
    return _getEvaluationListUsecase.execute((
      mediaId: mediaId,
      userId: null,
    ));
  }

  /// 나의 평가 목록을 구독해요.
  Stream<List<Evaluation?>> watchMyEvaluationsList() {
    return _watchEvaluationListUsecase.execute((
      userId: _userId,
      mediaId: null,
    ));
  }

  /// 나의 평가 개수를 조회해요.
  Future<int> countMyEvaluations() {
    return _countEvaluationsUsecase.execute((userId: _userId));
  }

  /// 나의 평가를 불러와요.
  Future<Evaluation?> fetchEvaluation({
    required String mediaId,
  }) {
    return _getEvaluationUsecase.execute((
      userId: _userId,
      mediaId: mediaId,
    ));
  }

  /// 평가를 생성 또는 수정해요.
  Future<Evaluation> submitEvaluation({
    required String mediaId,
    required Emotion emotion,
  }) {
    return _submitEvaluationUsecase.execute((
      executorId: _userId,
      mediaId: mediaId,
      emotion: emotion,
    ));
  }

  /// 평가를 제거해요.
  Future<void> removeEvaluation({
    required String mediaId,
  }) {
    return _removeEvaluationUsecase.execute((
      executorId: _userId,
      mediaId: mediaId,
    ));
  }

  String get _userId {
    final userId = _authService.currentUserId;
    if (userId == null) throw const UnauthorizedException();
    return userId;
  }
}
