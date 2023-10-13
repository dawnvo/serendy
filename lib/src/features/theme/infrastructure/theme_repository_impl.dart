import 'dart:io';

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
    int? page,
    int? perPage,
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
    final query = supabase //
        .from(_tableThemes)
        .select(columns)
        .is_('removed_at', null);
    //identity
    if (userId != null) query.eq('owner_id', userId);
    //pagination
    if (page != null) {
      final range = getPagination(page, perPage ?? 20);
      query.range(range.from, range.to);
    }
    //result
    return query.order('updated_at').withConverter(ThemeMapper.toList);
  }

  /**
   * (경량) 테마 정보를 불러와요.
   */
  @override
  Future<Theme?> fetchThemeSlice({
    required ThemeID id,
  }) {
    const columns = '''
      id,
      image,
      owner_id
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
      *,
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
    final entity = ThemeEntity(
      id: theme.id,
      title: theme.title,
      image: theme.image,
      private: theme.private,
      ownerId: theme.owner.id,
    ).toJson();
    return supabase //
        .from(_tableThemes)
        .insert(entity);
  }

  /**
   * 테마를 갱신해요.
   */
  @override
  Future<void> updateTheme(
    Theme theme,
  ) {
    final entity = ThemeEntity(
      title: theme.title,
      image: theme.image,
      private: theme.private,
      description: theme.description,
      updatedAt: theme.updatedAt,
    ).toJson();
    return supabase //
        .from(_tableThemes)
        .update(entity)
        .eq('id', theme.id);
  }

  /**
   * 테마를 제거해요.
   */
  @override
  Future<void> removeTheme(
    Theme theme,
  ) {
    final entity = ThemeEntity(
      removedAt: theme.removedAt,
    ).toJson();
    // [serializable] include_if_null: false
    entity['image'] = null;
    return supabase //
        .from(_tableThemes)
        .update(entity)
        .eq('id', theme.id);
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
      medias ( title, image )
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
    ).toJson();
    return supabase //
        .from(_tableThemeItems)
        .upsert(entity);
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
    ).toJson();
    return supabase //
        .from(_tableThemeItems)
        .delete()
        .match(entity);
  }

  /**
   * 이미지를 업로드해요.
   */
  @override
  Future<String?> uploadThemeImage(Theme theme) async {
    // * 이미지가 존재하는지 확인해요.
    if (theme.image == null || theme.image == '') return null;

    // * 파일이 존재하는지 확인해요.
    final imageFile = File(theme.image!);
    if (!await imageFile.exists()) return null;

    // * 이미지를 업로드해요.
    final imagePath = '${theme.owner.id}/${theme.id}';
    await supabase.storage //
        .from(_tableThemes)
        .upload(
          imagePath,
          imageFile,
          fileOptions: const FileOptions(upsert: true),
        );

    // * 이미지 주소를 가져와요.
    final imageUrl = supabase.storage //
        .from(_tableThemes)
        .getPublicUrl(imagePath);

    // * 이미지 주소에 타임스탬프를 추가해
    // * 변경을 (캐싱이) 감지할 수 있도록 해요.
    return addTimestampToUrl(imageUrl);
  }

  /**
   * 업로드한 이미지를 삭제해요.
   */
  @override
  Future<void> deleteThemeImage(Theme theme) async {
    // * 이미지가 존재하는지 확인해요.
    if (theme.image == null || theme.image == '') return;

    // * 업로드한 이미지를 삭제해요.
    final imagePath = '${theme.owner.id}/${theme.id}';
    await supabase.storage //
        .from(_tableThemes)
        .remove([imagePath]);
  }
}
