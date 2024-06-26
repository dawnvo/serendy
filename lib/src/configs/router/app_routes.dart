part of 'app_router.dart';

abstract final class AppRoutes {
  // 로그인
  static const signIn = SignInScreen.routeName;
  static const _signInLocation = SignInScreen.routeLocation;

  // 회원가입
  static const signUp = SignUpScreen.routeName;
  static const _signUpLocation = SignUpScreen.routeLocation;

  // 홈
  static const home = HomeScreen.routeName;
  static const _homeLocation = HomeScreen.routeLocation;

  // 발견
  static const discover = DiscoverScreen.routeName;
  static const _discoverLocation = DiscoverScreen.routeLocation;

  // 검색
  static const search = SearchScreen.routeName;
  static const _searchLocation = SearchScreen.routeLocation;

  // 프로필
  static const library = LibraryScreen.routeName;
  static const _libraryLocation = LibraryScreen.routeLocation;

  // 승급
  static const rank = RankModal.routeName;
  static const _rankLocation = RankModal.routeLocation;

  // 작품 정보
  static const media = MediaScreen.routeName;
  static const _mediaLocation = MediaScreen.routeLocation;

  // 작품 평가
  static const evaluateMedia = EvaluateMediaScreen.routeName;
  static const _evaluateMediaLocation = EvaluateMediaScreen.routeLocation;

  // 테마 정보
  static const theme = ThemeScreen.routeName;
  static const _themeLocation = ThemeScreen.routeLocation;

  // 테마 생성
  static const createTheme = CreateThemeScreen.routeName;
  static const _createThemeLocation = CreateThemeScreen.routeLocation;

  // 테마 편집
  static const editTheme = EditThemeScreen.routeName;
  static const _editThemeLocation = EditThemeScreen.routeLocation;

  // 기록
  static const history = HistoryScreen.routeName;
  static const _historyLocation = HistoryScreen.routeLocation;

  // 설정
  static const settings = SettingsScreen.routeName;
  static const _settingsLocation = SettingsScreen.routeLocation;

  // 계정
  static const account = AccountScreen.routeName;
  static const _accountLocation = AccountScreen.routeLocation;

  // 탈퇴
  static const exit = ExitScreen.routeName;
  static const _exitLocation = ExitScreen.routeLocation;
}
