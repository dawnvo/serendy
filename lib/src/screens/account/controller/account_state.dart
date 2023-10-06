part of 'account_controller.dart';

class AccountState extends Equatable {
  const AccountState({
    required this.initialProfile,
    required this.avatar,
    required this.name,
    required this.email,
  });

  final Profile initialProfile;
  final String? avatar;
  final String name;
  final String email;

  bool get isEdited =>
      initialProfile.avatar != avatar ||
      initialProfile.name != name ||
      initialProfile.email != email;

  AccountState copyWith({
    final Profile? initialProfile,
    final String? avatar,
    final String? name,
    final String? email,
  }) {
    return AccountState(
      initialProfile: initialProfile ?? this.initialProfile,
      avatar: avatar ?? this.avatar,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [
        avatar,
        name,
        email,
      ];
}
