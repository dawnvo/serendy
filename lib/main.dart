import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serendy/src/app_bootstrap.dart';
import 'package:serendy/src/core/exceptions/async_error_logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // * 환경 설정
  await dotenv.load();

  final bootstrap = AppBootstrap();
  final container = ProviderContainer(observers: [
    _TestLogger(),
    AsyncErrorLogger(),
  ]);

  // * 앱을 시작해요.
  final root = bootstrap.createRootWidget(container: container);
  runApp(root);
}

class _TestLogger extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    debugPrint('✅Added from ${provider.name ?? provider.runtimeType}');
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    debugPrint('👻Updated from ${provider.name ?? provider.runtimeType}');
  }

  @override
  void didDisposeProvider(
    ProviderBase provider,
    ProviderContainer container,
  ) {
    debugPrint('⛔Disposed from ${provider.name ?? provider.runtimeType}');
  }
}
