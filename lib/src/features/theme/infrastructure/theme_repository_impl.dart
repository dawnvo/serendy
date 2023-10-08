import 'package:serendy/src/configs/_mockup.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/profile/profile.dart';
import 'package:serendy/src/features/theme/theme.dart';

final class ThemeRepositoryImpl implements ThemeRepository {
  const ThemeRepositoryImpl(this.supabase);
  final SupabaseClient supabase;

  static const String _tableThemes = TablePath.themes;
  static const String _tableThemeItems = TablePath.themeItems;

  /**
   * 테마 여럿을 관찰해요.
   */
  @override
  Stream<List<Theme?>> watchThemes({
    UserID? userId,
  }) {
    return Stream.value(themesMock);
  }

  /**
   * 테마 여럿을 불러와요.
   */
  @override
  Future<List<Theme?>> fetchThemes({
    UserID? userId,
  }) async {
    return themesMock;
  }

  /**
   * (경량) 테마 정보를 불러와요.
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
  Future<void> createTheme(
    Theme theme,
  ) async {
    throw UnimplementedError();
  }

  /**
   * 테마를 갱신해요.
   */
  @override
  Future<void> updateTheme(
    Theme theme,
  ) async {
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
  Future<void> addItem(
    Theme theme,
    MediaID mediaId,
  ) async {
    throw UnimplementedError();
  }

  /**
   * 테마의 항목을 삭제해요.
   */
  @override
  Future<void> deleteItem(
    Theme theme,
    MediaID mediaId,
  ) async {
    throw UnimplementedError();
  }
}
