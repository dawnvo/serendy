part of 'create_collection_controller.dart';

enum CreateCollectionStatus { initial, loading, success, failure }

class CreateCollectionState extends Equatable {
  const CreateCollectionState({
    this.status = CreateCollectionStatus.initial,
    this.title = '',
    this.hintText = '',
    this.errorMessage,
  });

  final CreateCollectionStatus status;
  final String title;
  final String hintText;
  final String? errorMessage;

  CreateCollectionState copyWith({
    final CreateCollectionStatus? status,
    final String? title,
    final String? hintText,
    final String? errorMessage,
  }) {
    return CreateCollectionState(
      status: status ?? this.status,
      title: title ?? this.title,
      hintText: hintText ?? this.hintText,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        title,
        hintText,
        errorMessage,
      ];
}
