import 'package:serendy/configs/configs.dart';
import 'package:serendy/features/media/domain/media.dart';

abstract final class MediaMapper {
  static Media toDomain(Fragment$MediaFields data) {
    return Media(
      type: MediaType.values.byName(data.type.name),
      status: MediaStatus.values.byName(data.status.name),
      id: data.id,
      title: data.title,
      image: data.image,
      keywords: data.genres,
      isAdult: data.isAdult,
      startDate: data.startDate,
      endDate: data.endDate,
    );
  }

  static List<Media?> toDomains(List<Fragment$MediaFields> domains) {
    return domains.map((domain) => toDomain(domain)).toList();
  }
}
