import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/models/models.dart';

part 'edit_collection_provider.freezed.dart';
part 'edit_collection_provider.g.dart';
part 'edit_collection_state.dart';

@riverpod
class EditCollection extends _$EditCollection {
  @override
  EditCollectionState build(Collection collection) {
    return EditCollectionState(
      initialCollection: collection,
      image: collection.image,
      title: collection.title,
      description: collection.description,
      privacyStatus: collection.private,
    );
  }

  void changeImage(String? image) {
    state = state.copyWith(image: image);
  }

  void changeTitle(String title) {
    state = state.copyWith(title: title);
  }

  void changeDescription(String? description) {
    state = state.copyWith(description: description);
  }

  void changePrivacyStatus(bool status) {
    state = state.copyWith(privacyStatus: status);
  }

  void submit() {}
}
