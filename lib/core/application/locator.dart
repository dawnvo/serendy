import 'package:get_it/get_it.dart';
import 'package:serendy/core/core.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  CommonModule.dependencies();
  CollectionModule.dependencies();
}
