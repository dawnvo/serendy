import 'package:get_it/get_it.dart';
import 'package:serendy/configs/di/common_module.dart';
import 'package:serendy/configs/di/data_module.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  CommonModule.dependencies();
  DataModule.dependencies();
}
