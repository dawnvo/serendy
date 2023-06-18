import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serendy/features/media/data/media_repository.dart';
import 'package:serendy/features/media/domain/media.dart';

part 'add_media_state.dart';

class AddMediaCubit extends Cubit<AddMediaState> {
  AddMediaCubit({required this.mediaRepository}) : super(const AddMediaState());

  final MediaRepository mediaRepository;

  void imageChanged(String image) {
    emit(state.copyWith(image: image));
  }

  void titleChanged(String title) {
    emit(state.copyWith(title: title));
  }

  void keywordChanged(String keywords) {
    emit(state.copyWith(keywords: keywords.split('/')));
  }

  void isAdultChanged(bool isAdult) {
    emit(state.copyWith(isAdult: isAdult));
  }

  void typeChanged(MediaType type) {
    emit(state.copyWith(mediaType: type));
  }

  void statusChanged(MediaStatus status) {
    emit(state.copyWith(mediaStatus: status));
  }

  Future<void> submitted() async {
    emit(state.copyWith(status: AddMediaStatus.loading));

    final media = Media(
      type: state.mediaType,
      status: state.mediaStatus,
      image: state.image,
      title: state.title,
      keywords: state.keywords,
      isAdult: state.isAdult,
      startDate: state.startDate,
      endDate: state.endDate,
    );

    print(media);

    try {
      await mediaRepository.addMedia(media: media);

      emit(const AddMediaState(status: AddMediaStatus.success));
    } catch (err) {
      emit(state.copyWith(
        status: AddMediaStatus.failure,
        errorMessage: err.toString(),
      ));
    }
  }
}
