import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serendy/src/app_bootstrap.dart';
import 'package:serendy/src/core/exceptions/async_error_logger.dart';
import 'package:serendy/src/core/persistence/firebase_options.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // * 환경 설정
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final bootstrap = AppBootstrap();
  final container = ProviderContainer(observers: [
    _TestLogger(),
    AsyncErrorLogger(),
  ]);

  // * 앱을 시작해요.
  final root = bootstrap.createRootWidget(container: container);
  runApp(root);

  // * 스플래시 화면을 2초 동안 보여줘요.
  Timer(
    const Duration(seconds: 2),
    FlutterNativeSplash.remove,
  );
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
