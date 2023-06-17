part of 'edit_collection_bloc.dart';

sealed class EditCollectionEvent extends Equatable {
  const EditCollectionEvent();
}

/// 컬렉션 제목을 수정해요.
final class EditCollection$TitleChanged extends EditCollectionEvent {
  const EditCollection$TitleChanged(this.title);
  final String title;

  @override
  List<Object> get props => [title];
}

/// 컬렉션 이미지를 변경해요.
final class EditCollection$ImageChanged extends EditCollectionEvent {
  const EditCollection$ImageChanged(this.imagePath);
  final String? imagePath;

  @override
  List<Object> get props => [];
}

/// 컬렉션 설명을 수정해요.
final class EditCollection$DescriptionChanged extends EditCollectionEvent {
  const EditCollection$DescriptionChanged(this.description);
  final String description;

  @override
  List<Object> get props => [description];
}

/// 컬렉션 상태를 변경해요.
final class EditCollection$PrivacyStatusChanged extends EditCollectionEvent {
  const EditCollection$PrivacyStatusChanged(this.privacyStatus);
  final bool privacyStatus;

  @override
  List<Object> get props => [privacyStatus];
}

/// 수정한 컬렉션을 서버에 제출해요.
final class EditCollection$Submitted extends EditCollectionEvent {
  const EditCollection$Submitted();

  @override
  List<Object> get props => [];
}

/// 컬렉션을 제거해요.
final class EditCollection$CollectionDeleted extends EditCollectionEvent {
  const EditCollection$CollectionDeleted();

  @override
  List<Object> get props => [];
}
