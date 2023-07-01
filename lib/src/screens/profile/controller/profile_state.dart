part of 'profile_controller.dart';

class ProfileState extends Equatable {
  const ProfileState({
    required this.user,
    required this.evaluationsCount,
    required this.myCollections,
  });

  final User user;
  final int evaluationsCount;
  final List<Collection?> myCollections;

  ProfileState copyWith({
    final User? user,
    final int? evaluationsCount,
    final List<Collection?>? myCollections,
  }) {
    return ProfileState(
      user: user ?? this.user,
      evaluationsCount: evaluationsCount ?? this.evaluationsCount,
      myCollections: myCollections ?? this.myCollections,
    );
  }

  @override
  List<Object?> get props => [
        user,
        evaluationsCount,
        myCollections,
      ];
}
