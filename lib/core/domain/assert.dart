abstract final class CoreAssert {
  /// # '참'이 아니면 에러
  static void isTrue(bool expression, Exception exception) {
    if (!expression) throw exception;
  }

  /// # '거짓'이 아니면 에러
  static void isFalse(bool expression, Exception exception) {
    if (expression) throw exception;
  }

  /// # '값'이 없으면 에러
  static T notEmpty<T>(T? value, Exception exception) {
    if (value == null) throw exception;
    return value;
  }
}
