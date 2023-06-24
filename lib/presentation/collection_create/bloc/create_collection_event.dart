part of 'create_collection_bloc.dart';

sealed class CreateCollectionEvent extends Equatable {
  const CreateCollectionEvent();

  @override
  List<Object> get props => [];
}

/// 제목을 입력해요.
final class CreateCollection$TitleChanged extends CreateCollectionEvent {
  const CreateCollection$TitleChanged({required this.title});

  final String? title;
}

/// 양식을 서버에 제출해요.
final class CreateCollection$Submitted extends CreateCollectionEvent {
  const CreateCollection$Submitted();
}
