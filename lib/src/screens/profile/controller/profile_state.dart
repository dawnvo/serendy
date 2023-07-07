part of 'profile_controller.dart';

class ProfileState extends Equatable {
  const ProfileState({
    required this.user,
    required this.evaluationsCount,
    required this.myThemes,
  });

  final User user;
  final int evaluationsCount;
  final List<Theme?> myThemes;

  ProfileState copyWith({
    final User? user,
    final int? evaluationsCount,
    final List<Theme?>? myThemes,
  }) {
    return ProfileState(
      user: user ?? this.user,
      evaluationsCount: evaluationsCount ?? this.evaluationsCount,
      myThemes: myThemes ?? this.myThemes,
    );
  }

  @override
  List<Object?> get props => [
        user,
        evaluationsCount,
        myThemes,
      ];
}
