import 'package:graphql/client.dart';
import 'package:logger/logger.dart';
import 'package:serendy/core/core.dart';

abstract final class CommonModule {
  const CommonModule._();
  static void dependencies() {
    sl.registerSingleton<Logger>(logger);
    sl.registerSingleton<GraphQLClient>(graphQLClient);
  }
}
