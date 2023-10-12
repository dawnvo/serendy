import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/media/media.dart';

import 'media_mapper.dart';

final class MediaRepositoryImpl implements MediaRepository {
  const MediaRepositoryImpl(this.supabase);
  final SupabaseClient supabase;

  static const String _tableMedias = TablePath.medias;

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
        .from(_tableMedias)
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
    const columns = '*';
    final range = getPagination(
      page ?? 0,
      perPage ?? 20,
    );
    return supabase
        .from(_tableMedias)
        .select(columns)
        .range(range.from, range.to)
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
        .from(_tableMedias)
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
        .from(_tableMedias)
        .select(columns)
        .eq('id', id)
        .maybeSingle()
        .withConverter(MediaMapper.toSingle);
  }

  /**
   * 작품을 추가해요.
   */
  @override
  Future<void> upsertMedia(
    Media media,
  ) {
    final entity = MediaEntity(
      id: media.id,
      type: media.type,
      status: media.status,
      title: media.title,
      image: media.image,
      keywords: media.keywords,
      synopsis: media.synopsis,
      youtubeId: media.youtubeId,
      isAdult: media.isAdult,
      startDate: media.startDate,
      endDate: media.endDate,
    ).toJson();
    return supabase //
        .from(_tableMedias)
        .upsert(entity);
  }
}
