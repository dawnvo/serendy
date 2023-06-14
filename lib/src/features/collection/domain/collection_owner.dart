part of 'collection.dart';

/// [Entity]
final class CollectionOwner extends Equatable {
  /// 사용자 식별
  final String id;

  /// 사용자 이름
  final String name;

  const CollectionOwner({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
