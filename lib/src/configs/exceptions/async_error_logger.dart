import 'package:serendy/src/configs/configs.dart';

/// Provider 에러를 추적해요.
class AsyncErrorLogger extends ProviderObserver {
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

/// Provider 생애주기를 추적해요.
class ProviderObserverLogger extends ProviderObserver {
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
