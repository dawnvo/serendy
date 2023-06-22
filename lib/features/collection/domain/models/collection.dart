import 'package:ulid/ulid.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/features/media/media.dart';
import 'package:serendy/features/user/user.dart';

part 'collection_item.dart';
part 'collection_owner.dart';

typedef CollectionID = String;

/// [AggregateRoot]
final class Collection extends Equatable {
  final CollectionID id;

  /// 소유자
  final CollectionOwner owner;

  /// 제목
  final String title;

  /// 설명
  final String? description;

  /// 사진
  final String? image;

  /// 비공개 상태
  final bool private;

  /// 작품 목록
  final List<CollectionItem?> items;

  /// 작품 개수
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

  @override
  List<Object?> get props => [
        id,
        owner,
        title,
        image,
        private,
        description,
        items,
        itemCount,
        createdAt,
        updatedAt,
        removedAt,
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
    return copy(
      title: title,
      description: description,
      image: image,
      private: private,
      updatedAt: DateTime.now(),
    );
  }

  /// 테마 제거
  Collection remove() {
    return copy(
      image: '',
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

    return copy(
      items: added,
      itemCount: added.length,
      updatedAt: updatedAt,
    );
  }

  /// 테마 항목 제거
  Collection deleteItem(MediaID mediaId) {
    final deleted = items.where((_) => _?.media.id != mediaId).toList();
    return copy(
      items: deleted,
      itemCount: deleted.length,
      updatedAt: DateTime.now(),
    );
  }

  // ☹️ Boilerplate Code
  Collection copy({
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
      image: image == '' // 값이 비어있으면 null
          ? null
          : image ?? this.image,
      private: private ?? this.private,
      items: items ?? this.items,
      itemCount: itemCount ?? this.itemCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      removedAt: removedAt ?? this.removedAt,
    );
  }
}
