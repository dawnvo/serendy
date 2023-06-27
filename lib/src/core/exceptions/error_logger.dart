import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serendy/src/core/exceptions/core_exception.dart';

class ErrorLogger {
  void logError(Object error, StackTrace? stackTrace) {
    // * This can be replaced with a call to a crash reporting tool of choice
    debugPrint('$error, $stackTrace');
  }

  void logAppException(CoreException exception) {
    // * This can be replaced with a call to a crash reporting tool of choice
    debugPrint('$exception');
  }
}

final errorLoggerProvider = Provider<ErrorLogger>((ref) {
  return ErrorLogger();
});
