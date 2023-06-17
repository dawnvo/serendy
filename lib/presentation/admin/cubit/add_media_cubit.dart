import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serendy/features/media/domain/media.dart';

part 'add_media_state.dart';

class AddMediaCubit extends Cubit<AddMediaState> {
  AddMediaCubit() : super(const AddMediaState());

  void imageChanged(String image) {
    emit(state.copyWith(image: image));
  }

  void titleChanged(String title) {
    emit(state.copyWith(title: title));
  }

  void keywordChanged(String keyword) {
    emit(state.copyWith(keyword: keyword.split('/')));
  }

  void startDateChanged(DateTime startDate) {
    emit(state.copyWith(startDate: startDate));
  }

  void endDateChanged(DateTime endDate) {
    emit(state.copyWith(endDate: endDate));
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

  void submitted() {
    try {
      emit(state.copyWith(status: AddMediaStatus.success));
    } catch (err) {
      emit(state.copyWith(
        status: AddMediaStatus.failure,
        errorMessage: err.toString(),
      ));
    }
  }
}
