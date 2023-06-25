part of 'collection_controller.dart';

class CollectionState extends Equatable {
  const CollectionState({required this.collection});

  final Collection collection;

  @override
  List<Object?> get props => [collection];
}
