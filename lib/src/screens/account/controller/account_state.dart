part of 'account_controller.dart';

final class AccountState extends Equatable {
  const AccountState({
    required this.initialProfile,
    required this.email,
    required this.name,
    required this.image,
    this.isSubmitted = false,
  });

  final Profile initialProfile;
  final String email;
  final String name;
  final String? image;
  final bool isSubmitted;

  bool get isEdited =>
      initialProfile.email != email || initialProfile.name != name || initialProfile.image != image;

  AccountState copyWith({
    final Profile? initialProfile,
    final String? email,
    final String? name,
    final String? image,
    final bool? isSubmitted,
  }) {
    return AccountState(
      initialProfile: initialProfile ?? this.initialProfile,
      isSubmitted: isSubmitted ?? this.isSubmitted,
      email: email ?? this.email,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [
        email,
        name,
        image,
        isSubmitted,
      ];
}
