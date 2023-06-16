import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graphql/client.dart';
import 'package:serendy/features/collection/application/edit_collection_service.dart';
import 'package:serendy/features/collection/domain/collection.dart';

part 'edit_collection_event.dart';
part 'edit_collection_state.dart';

class EditCollectionBloc
    extends Bloc<EditCollectionEvent, EditCollectionState> {
  EditCollectionBloc({
    required this.editCollectionUseCase,
    required Collection initialCollection,
  }) : super(EditCollectionState(
          initialCollection: initialCollection,
          image: initialCollection.image,
          title: initialCollection.title,
          description: initialCollection.description,
          privacyStatus: initialCollection.private,
        )) {
    on<EditCollectionImageChanged>(_onImageChanged);
    on<EditCollectionTitleChanged>(_onTitleChanged);
    on<EditCollectionDescriptionChanged>(_onDescriptionChanged);
    on<EditCollectionPrivacyStatusChanged>(_onPrivacyStatusChanged);
    on<EditCollectionSubmitted>(_onSubmitted);
  }

  final EditCollectionUseCase editCollectionUseCase;

  void _onTitleChanged(
    EditCollectionTitleChanged event,
    Emitter<EditCollectionState> emit,
  ) {
    emit(state.copyWith(title: event.title));
  }

  void _onImageChanged(
    EditCollectionImageChanged event,
    Emitter<EditCollectionState> emit,
  ) {
    emit(state.copyWith(image: event.imagePath));
  }

  void _onDescriptionChanged(
    EditCollectionDescriptionChanged event,
    Emitter<EditCollectionState> emit,
  ) {
    emit(state.copyWith(description: event.description));
  }

  void _onPrivacyStatusChanged(
    EditCollectionPrivacyStatusChanged event,
    Emitter<EditCollectionState> emit,
  ) {
    emit(state.copyWith(privacyStatus: event.privacyStatus));
  }

  void _onSubmitted(
    EditCollectionSubmitted event,
    Emitter<EditCollectionState> emit,
  ) async {
    emit(state.copyWith(status: EditCollectionStatus.loading));

    try {
      await editCollectionUseCase.execute((
        collectionId: state.initialCollection.id,
        title: state.title,
        description: state.description,
        image: state.image,
        private: state.privacyStatus,
      ));

      emit(state.copyWith(status: EditCollectionStatus.success));
    } on GraphQLError catch (err) {
      emit(state.copyWith(
        status: EditCollectionStatus.failure,
        errorMessage: err.message,
      ));
    } catch (err) {
      emit(state.copyWith(
        status: EditCollectionStatus.failure,
        errorMessage: err.toString(),
      ));
    }
  }
}
