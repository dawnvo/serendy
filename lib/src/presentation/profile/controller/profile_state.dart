part of 'profile_controller.dart';

class ProfileState extends Equatable {
  const ProfileState({
    required this.evaluationsCount,
    required this.myCollections,
  });

  final int evaluationsCount;
  final List<Collection?> myCollections;

  @override
  List<Object?> get props => [
        evaluationsCount,
        myCollections,
      ];
}
