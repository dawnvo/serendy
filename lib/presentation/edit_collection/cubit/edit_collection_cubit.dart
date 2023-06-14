import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serendy/features/collection/domain/collection.dart';

part 'edit_collection_state.dart';

class EditCollectionCubit extends Cubit<EditCollectionState> {
  EditCollectionCubit({required this.collection})
      : super(EditCollectionState(
          initialCollection: collection,
          image: collection.image,
          title: collection.title,
          description: collection.description,
          privacyStatus: collection.private,
        ));

  final Collection collection;

  void imageChanged(String? image) {
    emit(state.copyWith(image: image));
  }

  void titleChanged(String title) {
    emit(state.copyWith(title: title));
  }

  void descriptionChanged(String description) {
    emit(state.copyWith(description: description));
  }

  void privacyStatusChanged(bool privacyStatus) {
    emit(state.copyWith(privacyStatus: privacyStatus));
  }

  void submitted() {}
}
