import 'package:get_it/get_it.dart';
import 'package:serendy/core/di/data_module.dart';
import 'package:serendy/features/auth/application/di/auth_module.dart';
import 'package:serendy/features/collection/application/di/collection_module.dart';
import 'package:serendy/features/evaluation/application/di/evaluation_module.dart';
import 'package:serendy/features/media/application/di/media_module.dart';
import 'package:serendy/features/user/application/di/user_module.dart';

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
