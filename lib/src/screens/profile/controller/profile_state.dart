part of 'profile_controller.dart';

class ProfileState extends Equatable {
  const ProfileState({
    required this.user,
    required this.myThemes,
    required this.evaluationsCount,
  });

  final User user;
  final List<Theme?> myThemes;
  final int evaluationsCount;

  ProfileState copyWith({
    final User? user,
    final List<Theme?>? myThemes,
    final int? evaluationsCount,
  }) {
    return ProfileState(
      user: user ?? this.user,
      myThemes: myThemes ?? this.myThemes,
      evaluationsCount: evaluationsCount ?? this.evaluationsCount,
    );
  }

  @override
  List<Object?> get props => [
        user,
        myThemes,
        evaluationsCount,
      ];
}
