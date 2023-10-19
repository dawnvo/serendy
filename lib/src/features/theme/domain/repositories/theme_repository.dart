import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';
import 'package:serendy/src/features/theme/theme.dart';

abstract class ThemeRepository {
  const ThemeRepository();

  /// 테마 여럿을 불러와요.
  Future<List<Theme?>> fetchThemes({
    UserID? userId,
    int? page,
    int? perPage,
  });

  /// (경량) 테마 정보를 불러와요.
  Future<Theme?> fetchThemeSlice({
    required ThemeID id,
  });

  /// 테마 정보를 불러와요.
  Future<Theme?> fetchTheme({
    required ThemeID id,
  });

  /// 테마를 만들어요.
  Future<void> createTheme(
    Theme theme,
  );

  /// 테마를 갱신해요.
  Future<void> updateTheme(
    Theme theme,
  );

  /// 테마를 제거해요.
  Future<void> removeTheme(
    Theme theme,
  );

  /// 테마 항목을 불러와요.
  Future<List<ThemeItem?>> fetchItems({
    required ThemeID id,
  });

  /// 테마에 항목을 추가해요.
  Future<void> addItem({
    required ThemeID themeId,
    required MediaID mediaId,
  });

  /// 테마의 항목을 삭제해요.
  Future<void> deleteItem({
    required ThemeID themeId,
    required MediaID mediaId,
  });

  /// 이미지를 업로드해요.
  Future<String?> uploadThemeImage(
    Theme theme,
  );

  /// 업로드한 이미지를 삭제해요.
  Future<void> deleteThemeImage(
    Theme theme,
  );
}
