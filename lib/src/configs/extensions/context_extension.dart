import 'package:flutter/material.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/widgets/widgets.dart';

extension ThemeX on BuildContext {
  /// [ThemeData]에서 필요없는 속성은 캡슐화해요.
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
}

extension MediaQueryX on BuildContext {
  /// [MediaQueryData]에서 필요없는 속성은 캡슐화해요.
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get screenWidth => mediaQuery.size.width;
  double get screenHeight => mediaQuery.size.height;
}

extension BottomSheetX on BuildContext {
  /// [BottomSheet] 기본 스타일을 수정해요.
  Future<T?> showCustomModalBottomSheet<T>(
    Widget Function(BuildContext context) builder,
  ) {
    return showModalBottomSheet<T>(
      context: this,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius),
          color: context.colorScheme.background,
        ),
        margin: const EdgeInsets.all(kContentPadding),
        child: BottomSheetTemplate(child: builder(this)),
      ),
    );
  }
}
