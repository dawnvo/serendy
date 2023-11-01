import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serendy/src/app_bootstrap.dart';
import 'package:serendy/src/configs/exceptions/async_error_logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // * 환경 설정
  await dotenv.load();

  final bootstrap = AppBootstrap();
  final container = ProviderContainer(observers: [
    ProviderObserverLogger(),
    AsyncErrorLogger(),
  ]);

  // * 앱을 시작해요.
  final root = await bootstrap.createRootWidget(container);
  runApp(root);
}
