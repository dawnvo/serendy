import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/core/types.dart';
import 'package:serendy/src/models/media/media.dart';
import 'package:serendy/src/models/user/user.dart';

part 'theme.g.dart';
part 'theme_item.dart';
part 'theme_owner.dart';

typedef ThemeID = String;

//AggregateRoot
@JsonSerializable()
final class Theme extends Equatable {
  final ThemeID id;

  // * 소유자
  final ThemeOwner owner;

  // * 비공개 여부
  final bool private;

  // * 제목
  final String title;

  // * 사진
  final String? image;

  // * 설명
  final String? description;

  // * 작품 목록
  final List<ThemeItem?> items;

  // * 작품 개수
  final int itemsCount;

  Theme({
    required this.id,
    required this.owner,
    required this.private,
    required this.title,
    this.image,
    this.description,
    final List<ThemeItem?>? items,
    final int? itemsCount,
  })  : items = items ?? [],
        itemsCount = itemsCount ?? 0;

  @override
  List<Object?> get props => [
        id,
        owner,
        title,
        image,
        private,
        description,
        items,
        itemsCount,
      ];

  factory Theme.fromJson(Json json) => _$ThemeFromJson(json);
  Json toJson() => _$ThemeToJson(this);
}

extension ThemeX on Theme {
  Theme copy({
    final ThemeID? id,
    final ThemeOwner? owner,
    final String? title,
    final String? description,
    final String? image,
    final bool? private,
    final List<ThemeItem?>? items,
    final int? itemsCount,
  }) {
    return Theme(
      id: id ?? this.id,
      owner: owner ?? this.owner,
      title: title ?? this.title,
      image: image == '' ? null : image ?? this.image, // 값이 비어있으면 null
      private: private ?? this.private,
      description: description ?? this.description,
      items: items ?? this.items,
      itemsCount: itemsCount ?? this.itemsCount,
    );
  }
}
