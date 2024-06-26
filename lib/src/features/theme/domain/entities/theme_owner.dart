part of 'theme.dart';

//entity
final class ThemeOwner extends Equatable {
  final UserID id;

  /// 사용자 이름
  final String username;

  const ThemeOwner({
    required this.id,
    required this.username,
  });

  @override
  List<Object?> get props => [id];

  User get convertEntity => User(
        id: id,
        email: '',
        username: username,
      );
}
