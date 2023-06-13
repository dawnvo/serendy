part of 'edit_collection_provider.dart';

@freezed
class EditCollectionState with _$EditCollectionState {
  const factory EditCollectionState({
    required Collection initialCollection,
    required String title,
    required String? image,
    required String? description,
    required bool privacyStatus,
  }) = _EditCollectionState;

  const EditCollectionState._();

  bool get isEdited =>
      initialCollection.title != title ||
      initialCollection.image != image ||
      initialCollection.description != description ||
      initialCollection.private != privacyStatus;
}
