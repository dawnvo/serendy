import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/features/collection/collection.dart';

part 'edit_collection_event.dart';
part 'edit_collection_state.dart';

class EditCollectionBloc
    extends Bloc<EditCollectionEvent, EditCollectionState> {
  EditCollectionBloc({
    required this.collectionService,
    required Collection initialCollection,
  }) : super(EditCollectionState(
          initialCollection: initialCollection,
          image: initialCollection.image,
          title: initialCollection.title,
          description: initialCollection.description,
          privacyStatus: initialCollection.private,
        )) {
    on<EditCollection$ImageChanged>(_onImageChanged);
    on<EditCollection$TitleChanged>(_onTitleChanged);
    on<EditCollection$DescriptionChanged>(_onDescriptionChanged);
    on<EditCollection$PrivacyStatusChanged>(_onPrivacyStatusChanged);
    on<EditCollection$Submitted>(_onSubmitted);
    on<EditCollection$CollectionDeleted>(_onCollectionDeleted);
  }

  final CollectionService collectionService;

  void _onTitleChanged(
    EditCollection$TitleChanged event,
    Emitter<EditCollectionState> emit,
  ) {
    emit(state.copyWith(title: event.title));
  }

  void _onImageChanged(
    EditCollection$ImageChanged event,
    Emitter<EditCollectionState> emit,
  ) {
    emit(state.copyWith(image: event.imagePath));
  }

  void _onDescriptionChanged(
    EditCollection$DescriptionChanged event,
    Emitter<EditCollectionState> emit,
  ) {
    emit(state.copyWith(description: event.description));
  }

  void _onPrivacyStatusChanged(
    EditCollection$PrivacyStatusChanged event,
    Emitter<EditCollectionState> emit,
  ) {
    emit(state.copyWith(privacyStatus: event.privacyStatus));
  }

  Future<void> _onSubmitted(
    EditCollection$Submitted event,
    Emitter<EditCollectionState> emit,
  ) async {
    emit(state.copyWith(status: EditCollectionStatus.loading));

    try {
      await collectionService.editCollection(
        id: state.initialCollection.id,
        title: state.title,
        description: state.description,
        image: state.image,
        private: state.privacyStatus,
      );

      emit(state.copyWith(status: EditCollectionStatus.success));
    } catch (err) {
      emit(state.copyWith(
        status: EditCollectionStatus.failure,
        errorMessage: err.toString(),
      ));
    }
  }

  Future<void> _onCollectionDeleted(
    EditCollection$CollectionDeleted event,
    Emitter<EditCollectionState> emit,
  ) async {
    emit(state.copyWith(status: EditCollectionStatus.loading));

    try {
      await collectionService.removeCollection(
        id: state.initialCollection.id,
      );

      emit(state.copyWith(
        status: EditCollectionStatus.success,
        isDeleted: true,
      ));
    } catch (err) {
      emit(state.copyWith(
        status: EditCollectionStatus.failure,
        errorMessage: err.toString(),
      ));
    }
  }
}
