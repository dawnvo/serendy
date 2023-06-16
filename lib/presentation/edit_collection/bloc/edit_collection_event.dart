part of 'edit_collection_bloc.dart';

sealed class EditCollectionEvent extends Equatable {
  const EditCollectionEvent();

  @override
  List<Object> get props => [];
}

/// 컬렉션 제목을 수정해요.
final class EditCollectionTitleChanged extends EditCollectionEvent {
  const EditCollectionTitleChanged(this.title);
  final String title;

  @override
  List<Object> get props => [title];
}

/// 컬렉션 이미지를 변경해요.
final class EditCollectionImageChanged extends EditCollectionEvent {
  const EditCollectionImageChanged(this.imagePath);
  final String? imagePath;
}

/// 컬렉션 설명을 수정해요.
final class EditCollectionDescriptionChanged extends EditCollectionEvent {
  const EditCollectionDescriptionChanged(this.description);
  final String description;

  @override
  List<Object> get props => [description];
}

/// 컬렉션 상태를 변경해요.
final class EditCollectionPrivacyStatusChanged extends EditCollectionEvent {
  const EditCollectionPrivacyStatusChanged(this.privacyStatus);
  final bool privacyStatus;

  @override
  List<Object> get props => [privacyStatus];
}

/// 수정한 컬렉션을 서버에 제출해요.
final class EditCollectionSubmitted extends EditCollectionEvent {
  const EditCollectionSubmitted();
}
