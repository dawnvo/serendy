part of 'edit_collection_controller.dart';

enum EditCollectionStatus { initial, loading, success, failure }

final class EditCollectionState extends Equatable {
  const EditCollectionState({
    this.status = EditCollectionStatus.initial,
    required this.initialCollection,
    required this.private,
    required this.title,
    this.image,
    this.description,
    this.errorMessage,
  });

  final EditCollectionStatus status;
  final Collection initialCollection;
  final String? image;
  final String title;
  final String? description;
  final bool private;
  final String? errorMessage;

  bool get isEdited =>
      initialCollection.image != image ||
      initialCollection.title != title ||
      initialCollection.description != description ||
      initialCollection.private != private;

  EditCollectionState copyWith({
    final EditCollectionStatus? status,
    final Collection? initialCollection,
    final String? image,
    final String? title,
    final String? description,
    final bool? private,
    final String? errorMessage,
  }) {
    return EditCollectionState(
      status: status ?? this.status,
      initialCollection: initialCollection ?? this.initialCollection,
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
      private: private ?? this.private,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        image,
        title,
        description,
        private,
        errorMessage,
      ];
}
