import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract final class Assets {
  static const appIcon = 'assets/images/app_icon.png';
  static const appLogo = 'assets/images/app_logo.png';

  static const googleIcon = 'assets/icons/google.svg';
  static const youtubeIcon = 'assets/icons/youtube.svg';

  static const themeDefaultImage = 'https://vo.la/EKT5x';
  static final themeFavoriteImage = dotenv.env['FAVORITE_THEME_IMAGE']!;
  static const createThemeHints = [
    '잔잔한 애니',
    '요즘 뜨는 애니',
    '한번 보면 밤샘하는 애니',
  ];
}
