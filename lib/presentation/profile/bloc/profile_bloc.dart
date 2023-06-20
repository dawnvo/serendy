import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/features/evaluation/evaluation.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required this.evaluationService})
      : super(const ProfileInitial()) {
    on<Profile$MyEvaluationsCounted>(_onMyCollectionsListFetched);
  }

  final EvaluationService evaluationService;

  Future<void> _onMyCollectionsListFetched(
    Profile$MyEvaluationsCounted event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileLoading());

    try {
      final count = await evaluationService.countMyEvaluations();
      emit(ProfileLoaded(evaluationsCount: count));
    } catch (err) {
      emit(ProfileError(err.toString()));
    }
  }
}
