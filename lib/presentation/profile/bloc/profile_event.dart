part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();
}

/// 나의 평가 개수를 조회해요.
final class Profile$MyEvaluationsCounted extends ProfileEvent {
  const Profile$MyEvaluationsCounted();

  @override
  List<Object> get props => [];
}
