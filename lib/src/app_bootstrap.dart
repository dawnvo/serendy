import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serendy/src/app.dart';
import 'package:serendy/src/core/exceptions/error_logger.dart';
import 'package:serendy/src/screens/profile/controller/profile_controller.dart';

class AppBootstrap {
  /// Create the root widget that should be passed to [runApp].
  Widget createRootWidget({required ProviderContainer container}) {
    // * Initialize listener
    container.read(profileControllerProvider);

    // * Register error handlers
    final errorLogger = container.read(errorLoggerProvider);
    registerErrorHandlers(errorLogger);

    return UncontrolledProviderScope(
      container: container,
      child: const SerendyApp(),
    );
  }

  // Register Flutter error handlers
  void registerErrorHandlers(ErrorLogger errorLogger) {
    // * Show some error UI if any uncaught exception happens
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      errorLogger.logError(details.exception, details.stack);
    };
    // * Handle errors from the underlying platform/OS
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      errorLogger.logError(error, stack);
      return true;
    };
    // * Show some error UI when any widget in the app fails to build
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('An error occurred'),
        ),
        body: Center(child: Text(details.toString())),
      );
    };
  }
}
