import 'package:flutter/material.dart';

extension ContextX on BuildContext {
  /// [ThemeData]에서 필요없는 속성은 캡슐화해요.
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;

  /// [MediaQueryData]에서 필요없는 속성은 캡슐화해요.
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get screenWidth => mediaQuery.size.width;
  double get screenHeight => mediaQuery.size.height;
}
