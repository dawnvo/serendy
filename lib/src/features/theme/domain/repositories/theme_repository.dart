import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/profile/profile.dart';
import 'package:serendy/src/features/theme/theme.dart';

abstract class ThemeRepository {
  const ThemeRepository();

  //Theme --------------------

  Stream<List<Theme?>> watchThemesList({
    UserID? userId,
  });

  Future<List<Theme?>> fetchThemesList({
    UserID? userId,
  });

  Future<Theme?> fetchThemeSlice({
    required ThemeID id,
  });

  Future<Theme?> fetchTheme({
    required ThemeID id,
  });

  Future<void> createTheme(Theme theme);

  Future<void> updateTheme(Theme theme);

  //ThemeItem --------------------

  Future<List<ThemeItem?>> fetchItems({
    required ThemeID id,
  });

  Future<void> addItem(Theme theme, MediaID mediaId);

  Future<void> deleteItem(Theme theme, MediaID mediaId);
}
