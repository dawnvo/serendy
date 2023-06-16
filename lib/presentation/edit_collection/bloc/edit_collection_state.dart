part of 'edit_collection_bloc.dart';

enum EditCollectionStatus { initial, loading, success, failure }

extension EditCollectionStatusX on EditCollectionStatus {
  bool get isInitial => this == EditCollectionStatus.initial;
  bool get isLoading => this == EditCollectionStatus.loading;
  bool get isSuccess => this == EditCollectionStatus.success;
  bool get isFailure => this == EditCollectionStatus.failure;
}

final class EditCollectionState extends Equatable {
  const EditCollectionState({
    this.status = EditCollectionStatus.initial,
    required this.initialCollection,
    required this.privacyStatus,
    required this.title,
    this.image,
    this.description,
    this.errorMessage,
  });

  final EditCollectionStatus status;
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
    final EditCollectionStatus? status,
    final Collection? initialCollection,
    final String? title,
    final String? image,
    final String? description,
    final bool? privacyStatus,
    final String? errorMessage,
  }) {
    return EditCollectionState(
      status: status ?? this.status,
      initialCollection: initialCollection ?? this.initialCollection,
      title: title ?? this.title,
      image: image ?? this.image,
      description: description ?? this.description,
      privacyStatus: privacyStatus ?? this.privacyStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        image,
        title,
        description,
        privacyStatus,
        errorMessage,
      ];
}
