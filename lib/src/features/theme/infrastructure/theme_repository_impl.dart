import 'package:serendy/src/core/_mock.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/features/user/user.dart';

final class ThemeRepositoryImpl implements ThemeRepository {
  const ThemeRepositoryImpl();

  @override
  Stream<List<Theme?>> watchMany(UserID userId) {
    return Stream.value(themesMock);
  }

  @override
  Future<List<Theme?>> findMany(UserID? userId) async {
    return themesMock;
  }

  @override
  Future<Theme?> findOne(ThemeID themeId) async {
    return themesMock[0];
  }

  @override
  Future<Theme?> fetchTheme(ThemeID themeId) async {
    return themesMock[0];
  }

  @override
  Future<List<ThemeItem?>> fetchThemeItems(ThemeID themeId) async {
    return themesMock[0].items;
  }

  @override
  Future<void> create(Theme theme) async {
    throw UnimplementedError();
  }

  @override
  Future<void> update(Theme theme) async {
    throw UnimplementedError();
  }

  @override
  Future<void> addItem(Theme theme, MediaID mediaId) async {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteItem(Theme theme, MediaID mediaId) async {
    throw UnimplementedError();
  }
}
