extension NumberX on int {
  /// 세자리마다 콤마를 표시해요.
  String get withComma {
    final numberStr = toString();
    final reversed = numberStr.split('').reversed.toList();

    final formatted = reversed.asMap().entries.fold([], (acc, entry) {
      final index = entry.key;
      final digit = entry.value;

      if (index != 0 && index % 3 == 0) {
        acc.add(',');
      }

      return acc..add(digit);
    });

    return formatted.reversed.join();
  }
}
