import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/features/evaluation/data/evaluation_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required this.evaluationRepository})
      : super(const ProfileInitial()) {
    on<Profile$MyEvaluationsCounted>(_onMyCollectionsListFetched);
  }

  final EvaluationRepository evaluationRepository;

  Future<void> _onMyCollectionsListFetched(
    Profile$MyEvaluationsCounted event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileLoading());

    try {
      final count = await evaluationRepository.countEvaluation();
      emit(ProfileLoaded(evaluationsCount: count));
    } catch (err) {
      emit(ProfileError(err.toString()));
    }
  }
}
