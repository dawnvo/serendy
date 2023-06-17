import 'package:graphql/client.dart';
import 'package:logger/logger.dart';
import 'package:serendy/configs/configs.dart';

abstract final class CommonModule {
  static void dependencies() {
    sl.registerSingleton<Logger>(Logger());
    sl.registerSingleton<GraphQLClient>(graphQLClient);
  }
}
