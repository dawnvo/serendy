part of 'my_collections_bloc.dart';

enum MyCollectionsStatus { initial, loading, success, failure }

final class MyCollectionsState extends Equatable {
  const MyCollectionsState({
    this.status = MyCollectionsStatus.initial,
    this.collections = const [],
    this.errorMessage,
  });

  final MyCollectionsStatus status;
  final List<Collection?> collections;
  final String? errorMessage;

  MyCollectionsState copyWith({
    final MyCollectionsStatus? status,
    final List<Collection?>? collections,
    final String? errorMessage,
  }) {
    return MyCollectionsState(
      status: status ?? this.status,
      collections: collections ?? this.collections,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        collections,
        errorMessage,
      ];
}
