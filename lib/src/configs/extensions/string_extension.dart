extension StringX on String {
  /// 글자 수가 길면 생략해요.
  String ellipsis([int maxLength = 20]) => length > maxLength //
      ? "${substring(0, maxLength)}..."
      : this;
}
