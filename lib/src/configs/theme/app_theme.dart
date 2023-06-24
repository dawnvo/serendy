import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:serendy/src/configs/constants/size_constant.dart';

sealed class AppColors {
  static const brand = Color(0xFF8F85FF);

  // light
  static const _lightSurface = Color(0xFFFFFBFF);
  static const _lightSurfaceVariant = Color(0xFFE5E1EC);
  static const _lightHighlightColor = Color(0x40C8C8C8);

  // dark
  static const _darkSurface = Color(0xFF121217);
  static const _darkSurfaceVariant = Color(0xFF212127);
  static const _darkHighlightColor = Color(0x12CCCCCC);

  /// [Brightness]에 따라 색상을 가져와요.
  static from(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    return (
      surface: isDark ? _darkSurface : _lightSurface,
      surfaceVariant: isDark ? _darkSurfaceVariant : _lightSurfaceVariant,
      highlightColor: isDark ? _darkHighlightColor : _lightHighlightColor,
    );
  }
}

final class AppThemeData {
  final ThemeData day;
  final ThemeData night;

  const AppThemeData({
    required this.day,
    required this.night,
  });

  factory AppThemeData.fillWith({ColorScheme? light, ColorScheme? dark}) {
    return AppThemeData(
      day: _createThemeData(light, Brightness.light),
      night: _createThemeData(dark, Brightness.dark),
    );
  }

  static ThemeData _createThemeData(
    ColorScheme? scheme,
    Brightness brightness,
  ) {
    final fallbackScheme = ColorScheme.fromSeed(
      seedColor: AppColors.brand,
      brightness: brightness,
    );

    // On Android S+ devices, use the provided dynamic color scheme.
    // Otherwise, use fallback schemes.
    final harmonized = scheme?.harmonized() ?? fallbackScheme;

    final (
      :surface,
      :surfaceVariant,
      :highlightColor,
    ) = AppColors.from(brightness);

    /// * 기본 컬러 설정
    final colorScheme = harmonized.copyWith(
      primary: AppColors.brand,
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

    /// * 커스텀 스타일 설정
    return themeData.copyWith(
      splashColor: highlightColor,
      highlightColor: highlightColor,
      scaffoldBackgroundColor: colorScheme.background,

      // Divider theme
      dividerTheme: themeData.dividerTheme.copyWith(space: 1),

      // NavigationBar theme
      navigationBarTheme: themeData.navigationBarTheme.copyWith(
        height: 56,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        indicatorColor: Colors.transparent,
        surfaceTintColor: colorScheme.background,
      ),

      // BottomSheet theme
      bottomSheetTheme: themeData.bottomSheetTheme.copyWith(
        surfaceTintColor: colorScheme.background,
      ),

      // ListTile theme
      listTileTheme: themeData.listTileTheme.copyWith(
        contentPadding: const EdgeInsets.symmetric(
          vertical: Sizes.p8,
          horizontal: kContentPadding,
        ),
      ),

      // SnackBar theme
      snackBarTheme: themeData.snackBarTheme.copyWith(
        actionTextColor: colorScheme.primary,
        backgroundColor: colorScheme.surfaceVariant,
        contentTextStyle: TextStyle(
          color: colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w600,
        ),
      ),

      // Dialog theme
      dialogTheme: themeData.dialogTheme.copyWith(
        actionsPadding: const EdgeInsets.all(Sizes.p8),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(kBorderRadius)),
        ),
      ),

      // Switch theme
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

      // TabBar theme
      tabBarTheme: themeData.tabBarTheme.copyWith(
        indicatorColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        overlayColor: const MaterialStatePropertyAll<Color?>(null),
      ),

      // Button theme
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
