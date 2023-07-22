import 'package:flutter/material.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/widgets/widgets.dart';

extension ThemeX on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
}

extension MediaQueryX on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get screenWidth => mediaQuery.size.width;
  double get screenHeight => mediaQuery.size.height;
}

extension BottomSheetX on BuildContext {
  Future<T?> showCustomBottomSheet<T>(WidgetBuilder builder) {
    return showModalBottomSheet<T>(
      context: this,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      barrierColor: colorScheme.surfaceTint.withOpacity(0.2),
      builder: (context) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(kBorderRadius)),
          color: context.colorScheme.surface,
        ),
        margin: const EdgeInsets.all(kContentPadding),
        child: BottomSheetTemplate(child: builder(this)),
      ),
    );
  }
}
