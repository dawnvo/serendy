import 'package:get_it/get_it.dart';
import 'package:serendy/core/di/data_module.dart';
import 'package:serendy/features/auth/application/auth_module.dart';
import 'package:serendy/features/collection/application/collection_module.dart';
import 'package:serendy/features/evaluation/application/evaluation_module.dart';
import 'package:serendy/features/media/application/media_module.dart';
import 'package:serendy/features/user/application/user_module.dart';

final sl = GetIt.instance;

class AppBinding {
  AppBinding._();

  static void dependencies() {
    DataModule.dependencies();
    AuthModule.dependencies();
    UserModule.dependencies();
    MediaModule.dependencies();
    CollectionModule.dependencies();
    EvaluationModule.dependencies();
  }
}
