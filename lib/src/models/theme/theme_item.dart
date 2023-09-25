part of 'theme.dart';

//Entity
@JsonSerializable()
final class ThemeItem extends Equatable {
  final ThemeID id;

  // * 제목
  final String title;

  // * 이미지
  final String image;

  // * 추가한 날짜
  final DateTime addedAt;

  const ThemeItem({
    required this.id,
    required this.title,
    required this.image,
    required this.addedAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        image,
        addedAt,
      ];

  Media get convertEntity => Media(
        id: id,
        title: title,
        image: image,
        //dummy
        keywords: const [],
        type: MediaType.anime,
        status: MediaStatus.finished,
      );

  factory ThemeItem.fromJson(Json json) => _$ThemeItemFromJson(json);
  Json toJson() => _$ThemeItemToJson(this);
}
