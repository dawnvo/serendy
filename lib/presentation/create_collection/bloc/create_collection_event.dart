part of 'create_collection_bloc.dart';

sealed class CreateCollectionEvent extends Equatable {
  const CreateCollectionEvent();

  @override
  List<Object> get props => [];
}

final class CreateCollectionTitleChanged extends CreateCollectionEvent {
  const CreateCollectionTitleChanged({required this.title});

  final String? title;
}

final class CreateCollectionSubmitted extends CreateCollectionEvent {
  const CreateCollectionSubmitted();
}
