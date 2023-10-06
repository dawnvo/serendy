import 'package:serendy/src/core/enums.dart';
import 'package:ulid/ulid.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';

part 'theme_item.dart';
part 'theme_owner.dart';

//Identity
typedef ThemeID = String;

//AggregateRoot
final class Theme extends Equatable {
  final ThemeID id;

  /// 소유자
  final ThemeOwner owner;

  /// 제목
  final String title;

  /// 사진
  final String? image;

  /// 비공개 여부
  final bool private;

  /// 설명
  final String? description;

  /// 작품 목록
  final List<ThemeItem?> items;

  /// 작품 개수
  final int itemsCount;

  /// 생성 날짜
  final DateTime createdAt;

  /// 갱신 날짜
  final DateTime updatedAt;

  /// 제거 날짜
  final DateTime? removedAt;

  Theme({
    required this.owner,
    required this.title,
    this.image,
    this.description,
    this.removedAt,
    final String? id,
    final bool? private,
    final List<ThemeItem?>? items,
    final int? itemsCount,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  })  : id = id ?? Ulid().toString(),
        private = private ?? false,
        items = items ?? [],
        itemsCount = itemsCount ?? 0,
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  @override
  List<Object?> get props => [id];
}

extension ThemeX on Theme {
  /// 테마 수정
  Theme edit({
    String? title,
    String? image,
    bool? private,
    String? description,
  }) {
    return copy(
      title: title,
      image: image,
      private: private,
      description: description,
      updatedAt: DateTime.now(),
    );
  }

  /// 테마 제거
  Theme remove() {
    return copy(
      image: '',
      removedAt: DateTime.now(),
    );
  }

  /// 테마 항목 추가
  Theme addItem(ThemeItem item) {
    DateTime? updatedAt;
    final added = [...items];

    // 추가하지 않은 경우, 항목 추가 후 날짜 갱신
    final doesExists = items.contains(item);
    if (!doesExists) {
      added.add(item);
      updatedAt = DateTime.now();
    }

    return copy(
      items: added,
      itemsCount: added.length,
      updatedAt: updatedAt,
    );
  }

  /// 테마 항목 제거
  Theme deleteItem(MediaID mediaId) {
    final deleted = items.where((_) => _?.mediaId != mediaId).toList();
    return copy(
      items: deleted,
      itemsCount: deleted.length,
      updatedAt: DateTime.now(),
    );
  }

  // ☹️ Boilerplate Code
  Theme copy({
    final ThemeID? id,
    final ThemeOwner? owner,
    final String? title,
    final String? image,
    final bool? private,
    final String? description,
    final List<ThemeItem?>? items,
    final int? itemsCount,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final DateTime? removedAt,
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
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      removedAt: removedAt ?? this.removedAt,
    );
  }
}
