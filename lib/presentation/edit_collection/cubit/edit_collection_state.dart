part of 'edit_collection_cubit.dart';

final class EditCollectionState extends Equatable {
  const EditCollectionState({
    required this.initialCollection,
    required this.privacyStatus,
    required this.title,
    this.image,
    this.description,
    this.errorMessage,
  });

  final Collection initialCollection;
  final bool privacyStatus;
  final String title;
  final String? image;
  final String? description;
  final String? errorMessage;

  bool get isEdited =>
      initialCollection.title != title ||
      initialCollection.image != image ||
      initialCollection.description != description ||
      initialCollection.private != privacyStatus;

  EditCollectionState copyWith({
    final Collection? initialCollection,
    final String? image,
    final String? title,
    final String? description,
    final bool? privacyStatus,
    final String? errorMessage,
  }) {
    return EditCollectionState(
      initialCollection: initialCollection ?? this.initialCollection,
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
      privacyStatus: privacyStatus ?? this.privacyStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        image,
        title,
        description,
        privacyStatus,
      ];
}
