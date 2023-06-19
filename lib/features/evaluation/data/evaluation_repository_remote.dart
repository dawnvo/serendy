import 'package:graphql/client.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/configs/mixin/graphql_error_handler_mixin.dart';
import 'package:serendy/features/evaluation/data/evaluation_repository.dart';
import 'package:serendy/features/evaluation/data/mapper/evaluation_mapper.dart';
import 'package:serendy/features/evaluation/domain/evaluation.dart';

final class EvaluationRepositoryRemote extends EvaluationRepository
    with GraphqlErrorHandlerMixin {
  EvaluationRepositoryRemote(this._client);
  final GraphQLClient _client;

  @override
  Future<List<Evaluation?>> fetchEvaluationList({
    String? userId,
    String? mediaId,
  }) async {
    final queryResult = await guard(
      () => _client.query$GetEvaluationList(Options$Query$GetEvaluationList(
        variables: Variables$Query$GetEvaluationList(
          userId: userId,
          mediaId: mediaId,
        ),
      )),
    );

    final datas = queryResult.parsedData!.GetEvaluationList;
    return EvaluationMapper.toDomains(datas);
  }

  @override
  Future<Evaluation?> fetchEvaluation(String mediaId) async {
    final queryResult = await guard(
      () => _client.query$GetEvaluation(Options$Query$GetEvaluation(
        variables: Variables$Query$GetEvaluation(mediaId: mediaId),
      )),
    );

    final data = queryResult.parsedData!.GetEvaluation;
    if (data == null) return null;

    return EvaluationMapper.toDomain(data);
  }

  @override
  Future<Evaluation> evaluate(String mediaId, Emotion emotion) async {
    final queryResult = await guard(
      () => _client.mutate$Evaluate(Options$Mutation$Evaluate(
        variables: Variables$Mutation$Evaluate(
          emotion: Enum$Emotion.values.byName(emotion.name),
          mediaId: mediaId,
        ),
      )),
    );

    final data = queryResult.parsedData!.Evaluate;
    return EvaluationMapper.toDomain(data);
  }

  @override
  Future<void> removeEvaluation(String mediaId) async {
    await guard(
      () => _client.mutate$RemoveEvaluation(Options$Mutation$RemoveEvaluation(
        variables: Variables$Mutation$RemoveEvaluation(mediaId: mediaId),
      )),
    );
  }
}
