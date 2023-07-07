import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract final class Assets {
  static const googleIcon = 'assets/icons/google.svg';
  static const youtubeIcon = 'assets/icons/youtube.svg';

  static const themeDefaultImage = 'https://vo.la/EKT5x';
  static final themeFavoriteImage = dotenv.env['FAVORITE_THEME_IMAGE']!;
  static const createThemeHints = [
    '지브리 명작 극장',
    '잔잔한 애니 모음',
    '요즘 한참 뜨거운 애니',
    '한번 보면 밤샘하는 애니',
  ];
}
