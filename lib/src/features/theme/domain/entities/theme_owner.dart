part of 'theme.dart';

/// [Entity]
final class ThemeOwner extends Equatable {
  final UserID id;

  /// 사용자 이름
  final String name;

  const ThemeOwner({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  User get convertEntity => User(
        id: id,
        name: name,
        email: '',
      );
}
