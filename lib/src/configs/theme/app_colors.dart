part of 'app_theme.dart';

sealed class AppColors {
  static const brand = Color(0xFFA594F9);

  //light
  static const _lightSurface = Color(0xFFFFFBFF);
  static const _lightSurfaceVariant = Color(0xFFE5E1EC);
  static const _lightHighlightColor = Color(0x40C8C8C8);

  //dark
  static const _darkSurface = Color(0xFF101012);
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
