import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';

abstract class ThemeRepository {
  Stream<List<Theme?>> watchMany(UserID userId);

  Future<List<Theme?>> findMany(UserID? userId);

  Future<Theme?> findOne(String themeId);

  Future<Theme?> fetchTheme(String themeId);

  Future<List<ThemeItem?>> fetchThemeItems(ThemeID themeId);

  Future<void> create(Theme theme);

  Future<void> update(Theme theme);

  Future<void> addItem(Theme theme, MediaID mediaId);

  Future<void> deleteItem(Theme theme, MediaID mediaId);
}
