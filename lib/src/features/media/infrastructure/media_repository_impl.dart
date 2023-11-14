import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';

import 'media_mapper.dart';

final class MediaRepositoryImpl implements MediaRepository {
  const MediaRepositoryImpl(this.supabase);
  final SupabaseClient supabase;

  static const String _tableMedia = TablePath.media;
  // static const String _tableMediaExternal = TablePath.mediaExternal;
  static const String _tableMediaStatistics = TablePath.mediaStatistics;
  static const String _tableMediaReaction = TablePath.mediaReaction;

  /**
   * 작품을 검색해요.
   */
  @override
  Future<List<Media?>> searchMedias({
    required String query,
    int? page,
    int? perPage,
  }) {
    const columns = '*';
    final range = getPagination(
      page ?? 0,
      perPage ?? 20,
    );
    return supabase
        .from(_tableMedia)
        .select(columns)
        .textSearch('title', "'$query'")
        .range(range.from, range.to)
        .withConverter(MediaMapper.toList);
  }

  /**
   * 작품 여럿을 불러와요.
   */
  @override
  Future<List<Media?>> fetchMedias({
    int? page,
    int? perPage,
  }) {
    const columns = '''
      id,
      type,
      status,
      title,
      image,
      keywords,
      start_date
    ''';
    final range = getPagination(
      page ?? 0,
      perPage ?? 20,
    );
    return supabase
        .from(_tableMedia)
        .select(columns)
        .range(range.from, range.to)
        // .order('start_date')
        // .order('hits_count')
        .withConverter(MediaMapper.toList);
  }

  /**
   * (경량) 작품 정보를 불러와요.
   */
  @override
  Future<Media?> fetchMediaSlice({
    required MediaID id,
  }) {
    const columns = '''
      id
    ''';
    return supabase
        .from(_tableMedia)
        .select(columns)
        .eq('id', id)
        .maybeSingle()
        .withConverter(MediaMapper.toSingle);
  }

  /**
   * 작품 정보를 불러와요.
   */
  @override
  Future<Media?> fetchMedia({
    required MediaID id,
  }) {
    const columns = '*';
    return supabase
        .from(_tableMedia)
        .select(columns)
        .eq('id', id)
        .maybeSingle()
        .withConverter(MediaMapper.toSingle);
  }

  /**
   * 작품 반응을 불러와요.
   */
  @override
  Future<List<MediaReaction?>> fetchReactions({
    required MediaID id,
  }) {
    const columns = '''
      emotion_id,
      count
    ''';
    return supabase
        .from(_tableMediaReaction)
        .select(columns)
        .eq('media_id', id)
        .withConverter(MediaReactionMapper.toList);
  }

  /**
   * 작품 조회수를 +1 해요.
   */
  @override
  Future<void> incrementHits(
    Media media,
  ) {
    final entity = MediaEntity(
      hitsCount: media.hitsCount + 1,
    ).toJson();
    return supabase //
        .from(_tableMediaStatistics)
        .update(entity)
        .eq('media_id', media.id);
  }
}
