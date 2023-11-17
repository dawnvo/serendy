import 'package:serendy/src/configs/configs.dart';

class ErrorObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    // * 에러가 없는 경우 작업을 끝내요.
    final error = _findError(newValue);
    if (error == null) return;

    // * 에러를 기록해요.
    final errorLogger = container.read(errorLoggerProvider);
    if (error.error is CoreException) {
      errorLogger.logAppException(error.error as CoreException);
    } else {
      errorLogger.logError(error.error, error.stackTrace);
    }
  }

  AsyncError<dynamic>? _findError(Object? value) {
    return value is AsyncError ? value : null;
  }
}
