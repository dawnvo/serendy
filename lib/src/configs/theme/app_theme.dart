import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:serendy/src/configs/constants/size_constant.dart';

part 'app_colors.dart';

final class AppThemeData {
  final ThemeData day;
  final ThemeData night;

  const AppThemeData({
    required this.day,
    required this.night,
  });

  factory AppThemeData.fillWith() {
    return AppThemeData(
      day: _createThemeData(Brightness.light),
      night: _createThemeData(Brightness.dark),
    );
  }

  static ThemeData _createThemeData(Brightness brightness) {
    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.brand,
      brightness: brightness,
    );

    final (
      :surface,
      :surfaceVariant,
      :highlightColor,
    ) = AppColors.from(brightness);

    /// * 기본 컬러 설정
    final colorScheme = scheme.copyWith(
      background: surface,
      surface: surface,
      surfaceVariant: surfaceVariant,
    );

    /// * 기본 스타일 설정
    final themeData = ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      fontFamily: 'Pretendard',
    );

    /// * 기본 스타일 수정
    return themeData.copyWith(
      splashColor: highlightColor,
      highlightColor: highlightColor,
      scaffoldBackgroundColor: colorScheme.background,

      //page-transitions
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.windows: SharedAxisPageTransitionsBuilder(
            transitionType: SharedAxisTransitionType.horizontal,
          ),
          TargetPlatform.android: SharedAxisPageTransitionsBuilder(
            transitionType: SharedAxisTransitionType.horizontal,
          ),
          TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
            transitionType: SharedAxisTransitionType.horizontal,
          ),
        },
      ),

      //app-bar
      appBarTheme: themeData.appBarTheme.copyWith(
        titleSpacing: kContentPadding,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: colorScheme.background,
        ),
      ),

      //divider
      dividerTheme: themeData.dividerTheme.copyWith(space: 1),

      //navigation-bar
      navigationBarTheme: themeData.navigationBarTheme.copyWith(
        height: Sizes.p56,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        indicatorColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),

      // BottomSheet theme
      bottomSheetTheme: themeData.bottomSheetTheme.copyWith(
        surfaceTintColor: Colors.transparent,
      ),

      //list-tile
      listTileTheme: themeData.listTileTheme.copyWith(
        contentPadding: const EdgeInsets.symmetric(
          vertical: Sizes.p8,
          horizontal: kContentPadding,
        ),
      ),

      //snack-bar
      snackBarTheme: themeData.snackBarTheme.copyWith(
        behavior: SnackBarBehavior.floating,
        contentTextStyle: TextStyle(
          color: colorScheme.surfaceVariant,
          fontWeight: FontWeight.w500,
        ),
      ),

      //dialog
      dialogTheme: themeData.dialogTheme.copyWith(
        actionsPadding: const EdgeInsets.all(Sizes.p8),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(kBorderRadius)),
        ),
      ),

      //switch
      switchTheme: themeData.switchTheme.copyWith(
        thumbColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return null;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.outlineVariant;
          }
          return null;
        }),
      ),

      //tab-bar
      tabBarTheme: themeData.tabBarTheme.copyWith(
        indicatorColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        overlayColor: const MaterialStatePropertyAll<Color?>(null),
      ),

      //button
      iconButtonTheme: const IconButtonThemeData(style: _buttonStyles),
      textButtonTheme: const TextButtonThemeData(style: _buttonStyles),
      filledButtonTheme: const FilledButtonThemeData(style: _buttonStyles),
      outlinedButtonTheme: const OutlinedButtonThemeData(style: _buttonStyles),
      elevatedButtonTheme: const ElevatedButtonThemeData(style: _buttonStyles),
    );
  }

  static const _buttonStyles = ButtonStyle(
    textStyle: MaterialStatePropertyAll(TextStyle(fontWeight: FontWeight.bold)),
    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(Sizes.p12)),
    )),
  );
}
