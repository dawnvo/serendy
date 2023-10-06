part of 'profile_controller.dart';

final class ProfileState extends Equatable {
  const ProfileState({
    this.evaluationsCount = 0,
    this.themes = const [],
  });

  final int evaluationsCount;
  final List<Theme?> themes;

  ProfileState copyWith({
    final int? evaluationsCount,
    final List<Theme?>? themes,
  }) {
    return ProfileState(
      evaluationsCount: evaluationsCount ?? this.evaluationsCount,
      themes: themes ?? this.themes,
    );
  }

  @override
  List<Object?> get props => [
        evaluationsCount,
        themes,
      ];
}
