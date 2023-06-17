import 'package:graphql/client.dart';

mixin GraphqlErrorHandlerMixin {
  Future<QueryResult<T>> guard<T>(
    Future<QueryResult<T>> Function() future,
  ) async {
    try {
      final result = await future();
      if (result.hasException) throw result.exception!;

      return result;
    } on OperationException catch (err) {
      /// 클라이언트 오류 (네트워크 또는 캐시)
      if (err.linkException != null) {
        throw err.linkException!;
      }

      /// GraphQL 서버 오류
      else {
        final message = err.graphqlErrors.first.message;
        throw Exception(message);
      }

      /// 기타 오류
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
