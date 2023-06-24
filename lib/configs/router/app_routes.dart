part of 'app_router.dart';

abstract final class AppRoutes {
  // 로그인
  static const signInName = SignInScreen.routeName;
  static const signInLocation = SignInScreen.routeLocation;

  // 홈
  static const homeName = HomeScreen.routeName;
  static const homeLocation = HomeScreen.routeLocation;

  // 발견
  static const discoverName = DiscoverScreen.routeName;
  static const discoverLocation = DiscoverScreen.routeLocation;

  // 검색
  static const searchName = SearchScreen.routeName;
  static const searchLocation = SearchScreen.routeLocation;

  // 프로필
  static const profileName = ProfileScreen.routeName;
  static const profileLocation = ProfileScreen.routeLocation;

  // 미디어 정보
  static const mediaName = MediaScreen.routeName;
  static const mediaLocation = MediaScreen.routeLocation;

  // 미디어 평가
  static const evaluateMediaName = EvaluateMediaScreen.routeName;
  static const evaluateMediaLocation = EvaluateMediaScreen.routeLocation;

  // 컬렉션 정보
  static const collectionName = CollectionScreen.routeName;
  static const collectionLocation = CollectionScreen.routeLocation;

  // 컬렉션 생성
  static const createCollectionName = CreateCollectionScreen.routeName;
  static const createCollectionLocation = CreateCollectionScreen.routeLocation;

  // 컬렉션 편집
  static const editCollectionName = EditCollectionScreen.routeName;
  static const editCollectionLocation = EditCollectionScreen.routeLocation;

  // 기록
  static const historyName = HistoryScreen.routeName;
  static const historyLocation = HistoryScreen.routeLocation;

  // 설정
  static const settingsName = SettingsScreen.routeName;
  static const settingsLocation = SettingsScreen.routeLocation;

  // 계정
  static const accountName = AccountScreen.routeName;
  static const accountLocation = AccountScreen.routeLocation;

  // 관리자
  static const adminName = AdminScreen.routeName;
  static const adminLocation = AdminScreen.routeLocation;
}
