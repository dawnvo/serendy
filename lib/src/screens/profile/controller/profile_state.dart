part of 'profile_controller.dart';

class ProfileState extends Equatable {
  const ProfileState({
    required this.evaluationsCount,
    required this.myCollections,
  });

  final int evaluationsCount;
  final List<Collection?> myCollections;

  ProfileState copyWith({
    int? evaluationsCount,
    List<Collection?>? myCollections,
  }) {
    return ProfileState(
      evaluationsCount: evaluationsCount ?? this.evaluationsCount,
      myCollections: myCollections ?? this.myCollections,
    );
  }

  @override
  List<Object?> get props => [
        evaluationsCount,
        myCollections,
      ];
}
