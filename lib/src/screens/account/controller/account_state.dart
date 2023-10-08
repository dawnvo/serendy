part of 'account_controller.dart';

class AccountState extends Equatable {
  const AccountState({
    required this.initialProfile,
    required this.email,
    required this.name,
    required this.avatar,
  });

  final Profile initialProfile;
  final String email;
  final String name;
  final String? avatar;

  bool get isEdited =>
      initialProfile.email != email ||
      initialProfile.name != name ||
      initialProfile.avatar != avatar;

  AccountState copyWith({
    final Profile? initialProfile,
    final String? email,
    final String? name,
    final String? avatar,
  }) {
    return AccountState(
      initialProfile: initialProfile ?? this.initialProfile,
      email: email ?? this.email,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  List<Object?> get props => [
        email,
        name,
        avatar,
      ];
}
