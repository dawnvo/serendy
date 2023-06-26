part of 'account_controller.dart';

class AccountState extends Equatable {
  const AccountState({
    required this.initialUser,
    required this.avatar,
    required this.name,
    required this.email,
  });

  final User initialUser;
  final String? avatar;
  final String name;
  final String email;

  bool get isEdited =>
      initialUser.avatar != avatar ||
      initialUser.name != name ||
      initialUser.email != email;

  AccountState copyWith({
    final User? initialUser,
    final String? avatar,
    final String? name,
    final String? email,
  }) {
    return AccountState(
      initialUser: initialUser ?? this.initialUser,
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
