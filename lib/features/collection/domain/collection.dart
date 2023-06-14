import 'package:ulid/ulid.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/features/media/domain/media.dart';

part 'collection_owner.dart';
part 'collection_item.dart';

typedef CollectionID = String;

/// [AggregateRoot]
final class Collection extends Equatable {
  /// 식별자
  final CollectionID id;

  /// 제작자
  final CollectionOwner owner;

  /// 제목
  final String title;

  /// 설명
  final String? description;

  /// 커버 사진
  final String? image;

  /// 비공개 여부
  final bool private;

  /// 작품들
  final List<CollectionItem?> items;

  /// 작품 수
  final int itemCount;

  /// 생성 날짜
  final DateTime createdAt;

  /// 갱신 날짜
  final DateTime updatedAt;

  /// 제거 날짜
  final DateTime? removedAt;

  Collection({
    required this.owner,
    required this.title,
    this.description,
    this.image,
    this.removedAt,
    final String? id,
    final bool? private,
    final List<CollectionItem?>? items,
    final int? itemCount,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  })  : id = id ?? Ulid().toString(),
        private = private ?? false,
        items = items ?? [],
        itemCount = itemCount ?? 0,
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  // ☹️ Boilerplate Code
  Collection copyWith({
    final CollectionID? id,
    final CollectionOwner? owner,
    final String? title,
    final String? description,
    final String? image,
    final bool? private,
    final List<CollectionItem?>? items,
    final int? itemCount,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final DateTime? removedAt,
  }) {
    return Collection(
      id: id ?? this.id,
      owner: owner ?? this.owner,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      private: private ?? this.private,
      items: items ?? this.items,
      itemCount: itemCount ?? this.itemCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      removedAt: removedAt ?? this.removedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        owner,
        title,
        description,
        image,
        private,
        items,
        createdAt,
        updatedAt,
      ];
}

extension CollectionX on Collection {
  /// 테마 수정
  Collection edit({
    String? title,
    String? description,
    String? image,
    bool? private,
  }) {
    return copyWith(
      title: title,
      description: description,
      image: image,
      private: private,
      updatedAt: DateTime.now(),
    );
  }

  /// 테마 제거
  Collection remove() {
    return copyWith(
      image: null,
      removedAt: DateTime.now(),
    );
  }

  /// 테마 항목 추가
  Collection addItem(CollectionItem item) {
    DateTime? updatedAt;
    final added = [...items];

    // 추가하지 않은 경우, 항목 추가 후 날짜 갱신
    final doesExists = items.contains(item);
    if (!doesExists) {
      added.add(item);
      updatedAt = DateTime.now();
    }

    return copyWith(
      items: added,
      itemCount: added.length,
      updatedAt: updatedAt,
    );
  }

  /// 테마 항목 제거
  Collection deleteItem(MediaID mediaId) {
    final deleted = items.where((_) => _?.media.id != mediaId).toList();
    return copyWith(
      items: deleted,
      itemCount: deleted.length,
      updatedAt: DateTime.now(),
    );
  }
}
