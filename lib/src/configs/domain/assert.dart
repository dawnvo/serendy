abstract final class CoreAssert {
  static void isTrue(bool expression, Exception exception) {
    if (!expression) throw exception;
  }

  static void isFalse(bool expression, Exception exception) {
    if (expression) throw exception;
  }

  static T notEmpty<T>(T? value, Exception exception) {
    if (value == null) throw exception;
    return value;
  }
}
