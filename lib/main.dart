import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serendy/src/app_bootstrap.dart';
import 'package:serendy/src/core/exceptions/async_error_logger.dart';
import 'package:serendy/src/core/persistence/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final bootstrap = AppBootstrap();
  final container = ProviderContainer(observers: [
    _TestLogger(),
    AsyncErrorLogger(),
  ]);

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
