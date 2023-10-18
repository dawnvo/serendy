/// Use this mixin if you need to check if the Notifier is mounted before
/// setting the state (usually, following an asynchronous operation).
///
/// refer:
/// https://codewithandrea.com/articles/async-notifier-mounted-riverpod/
mixin NotifierMounted {
  bool _mounted = true;

  void setUnmounted() => _mounted = false;

  bool get mounted => _mounted;
}
