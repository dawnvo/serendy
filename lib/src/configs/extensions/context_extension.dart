import 'package:flutter/material.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/widgets/widgets.dart';

extension ContextX on BuildContext {
  /// [ThemeData]에서 필요없는 속성은 캡슐화해요.
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;

  /// [MediaQueryData]에서 필요없는 속성은 캡슐화해요.
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get screenWidth => mediaQuery.size.width;
  double get screenHeight => mediaQuery.size.height;

  /// [BottomSheet] 기본 스타일을 수정해요.
  Future<T?> showCustomModalBottomSheet<T>(
    Widget Function(BuildContext context) builder,
  ) {
    return showModalBottomSheet<T>(
      useRootNavigator: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius)),
      context: this,
      builder: (context) => BottomSheetTemplate(child: builder(this)),
    );
  }
}
