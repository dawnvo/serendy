import 'package:serendy/src/core/_mock.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/features/profile/profile.dart';

final class ThemeRepositoryImpl implements ThemeRepository {
  const ThemeRepositoryImpl();

  /**
   * 테마를 여럿 관찰해요.
   */
  @override
  Stream<List<Theme?>> watchThemesList({
    UserID? userId,
  }) {
    return Stream.value(themesMock);
  }

  /**
   * 테마를 여럿 불러와요.
   */
  @override
  Future<List<Theme?>> fetchThemesList({
    UserID? userId,
  }) async {
    return themesMock;
  }

  /**
   * 테마 정보를 불러와요. (경량)
   */
  @override
  Future<Theme?> fetchThemeSlice({
    required ThemeID id,
  }) async {
    return themesMock[0];
  }

  /**
   * 테마 정보를 불러와요.
   */
  @override
  Future<Theme?> fetchTheme({
    required ThemeID id,
  }) async {
    return themesMock[0];
  }

  /**
   * 테마를 만들어요.
   */
  @override
  Future<void> createTheme(Theme theme) async {
    throw UnimplementedError();
  }

  /**
   * 테마를 갱신해요.
   */
  @override
  Future<void> updateTheme(Theme theme) async {
    throw UnimplementedError();
  }

  /**
   * 테마 항목을 불러와요.
   */
  @override
  Future<List<ThemeItem?>> fetchItems({
    required ThemeID id,
  }) async {
    return themesMock[0].items;
  }

  /**
   * 테마에 항목을 추가해요.
   */
  @override
  Future<void> addItem(Theme theme, MediaID mediaId) async {
    throw UnimplementedError();
  }

  /**
   * 테마의 항목을 삭제해요.
   */
  @override
  Future<void> deleteItem(Theme theme, MediaID mediaId) async {
    throw UnimplementedError();
  }
}
