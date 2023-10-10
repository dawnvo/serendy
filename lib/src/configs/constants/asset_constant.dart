import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract final class Assets {
  static const String imagePath = 'assets/images';
  static const appIcon = '$imagePath/app_icon.png';
  static const appLogo = '$imagePath/app_logo.png';

  static const String iconPath = 'assets/icons';
  static const googleIcon = '$iconPath/logos/google.svg';
  static const youtubeIcon = '$iconPath/logos/youtube.svg';

  static final themeDefaultImage = dotenv.env['THEME_DEFAULT_IMAGE']!;
  static final themeFavoriteImage = dotenv.env['THEME_FAVORITE_IMAGE']!;
  static const createThemeHints = [
    '나의 테마',
    '잔잔한 애니',
    '한번 보면 밤샘하는 애니',
  ];
}
