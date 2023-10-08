import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/profile/profile.dart';
import 'package:serendy/src/features/theme/theme.dart';

import 'theme_mapper.dart';

final class ThemeRepositoryImpl implements ThemeRepository {
  const ThemeRepositoryImpl(this.supabase);
  final SupabaseClient supabase;

  static const String _tableThemes = TablePath.themes;
  static const String _tableThemeItems = TablePath.themeItems;

  /**
   * 테마 여럿을 불러와요.
   */
  @override
  Future<List<Theme?>> fetchThemes({
    UserID? userId,
  }) {
    const columns = '''
      id,
      title,
      image,
      private,
      description,
      items_count,
      owner_id,
      profiles ( name, avatar )
    ''';
    final query = supabase.from(_tableThemes).select(columns);
    if (userId != null) query.eq('owner_id', userId);
    return query //
        .is_('removed_at', null)
        .range(0, 10)
        .withConverter(ThemeMapper.toList);
  }

  /**
   * (경량) 테마 정보를 불러와요.
   */
  @override
  Future<Theme?> fetchThemeSlice({
    required ThemeID id,
  }) {
    const columns = '''
      id
    ''';
    return supabase
        .from(_tableThemes)
        .select(columns)
        .eq('id', id)
        .is_('removed_at', null)
        .maybeSingle()
        .withConverter(ThemeMapper.toSingle);
  }

  /**
   * 테마 정보를 불러와요.
   */
  @override
  Future<Theme?> fetchTheme({
    required ThemeID id,
  }) {
    const columns = '''
      id,
      title,
      image,
      private,
      description,
      items_count,
      owner_id,
      profiles ( name, avatar )
    ''';
    return supabase
        .from(_tableThemes)
        .select(columns)
        .eq('id', id)
        .is_('removed_at', null)
        .maybeSingle()
        .withConverter(ThemeMapper.toSingle);
  }

  /**
   * 테마를 만들어요.
   */
  @override
  Future<void> createTheme(
    Theme theme,
  ) {
    final entity = ThemeMapper.toEntity(theme);
    return supabase //
        .from(_tableThemes)
        .insert(entity.toJson());
  }

  /**
   * 테마를 갱신해요.
   */
  @override
  Future<void> updateTheme(
    Theme theme,
  ) {
    final entity = ThemeMapper.toEntity(theme);
    return supabase //
        .from(_tableThemes)
        .update(entity.toJson())
        .eq('id', entity.id);
  }

  /**
   * 테마 항목을 불러와요.
   */
  @override
  Future<List<ThemeItem?>> fetchItems({
    required ThemeID id,
  }) {
    const columns = '''
      added_at,
      media_id,
      medias ( * )
    ''';
    return supabase
        .from(_tableThemeItems)
        .select(columns)
        .eq('theme_id', id)
        .withConverter(ThemeItemMapper.toList);
  }

  /**
   * 테마에 항목을 추가해요.
   */
  @override
  Future<void> addItem({
    required ThemeID themeId,
    required MediaID mediaId,
  }) {
    final entity = ThemeItemEntity(
      themeId: themeId,
      mediaId: mediaId,
    );
    return supabase //
        .from(_tableThemeItems)
        .upsert(entity.toJson());
  }

  /**
   * 테마의 항목을 삭제해요.
   */
  @override
  Future<void> deleteItem({
    required ThemeID themeId,
    required MediaID mediaId,
  }) {
    final entity = ThemeItemEntity(
      themeId: themeId,
      mediaId: mediaId,
    );
    return supabase //
        .from(_tableThemeItems)
        .delete()
        .match(entity.toJson());
  }
}
