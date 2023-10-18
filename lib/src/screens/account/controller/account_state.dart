part of 'account_controller.dart';

final class AccountState extends Equatable {
  const AccountState({
    required this.initialProfile,
    required this.email,
    required this.name,
    this.isSubmitted = false,
  });

  final Profile initialProfile;
  final String email;
  final String name;
  final bool isSubmitted;

  bool get isEdited =>
      initialProfile.email != email || //
      initialProfile.name != name;

  AccountState copyWith({
    final Profile? initialProfile,
    final String? email,
    final String? name,
    final bool? isSubmitted,
  }) {
    return AccountState(
      initialProfile: initialProfile ?? this.initialProfile,
      isSubmitted: isSubmitted ?? this.isSubmitted,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [
        email,
        name,
        isSubmitted,
      ];
}
