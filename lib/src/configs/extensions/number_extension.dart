extension NumberX on int {
  /// 세자리마다 콤마를 표시해요.
  String get withComma {
    final numberStr = toString();
    String result = '';

    int commaCount = 0;
    for (int i = numberStr.length - 1; i >= 0; i--) {
      result = numberStr[i] + result;
      commaCount++;
      if (commaCount % 3 == 0 && i > 0) {
        result = ',$result';
      }
    }

    return result;
  }
}
