import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract final class Assets {
  static const String applink = 'https://serendy.vercel.app';

  static const String imagePath = 'assets/images';
  static const String appIcon = '$imagePath/app_icon.png';
  static const String appLogo = '$imagePath/app_logo.png';

  static const String iconPath = 'assets/icons';
  static const String googleIcon = '$iconPath/logos/google.svg';
  static const String youtubeIcon = '$iconPath/logos/youtube.svg';

  static final String themeDefaultImage = dotenv.env['THEME_DEFAULT_IMAGE']!;
  static final String themeFavoriteImage = dotenv.env['THEME_FAVORITE_IMAGE']!;

  static const int usernameMaxLength = 20;
}
