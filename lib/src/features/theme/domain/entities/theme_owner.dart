part of 'theme.dart';

//Entity
final class ThemeOwner extends Equatable {
  final UserID id;

  /// 사용자 이름
  final String name;

  // * 프로필 사진
  final String? image;

  const ThemeOwner({
    required this.id,
    required this.name,
    this.image,
  });

  @override
  List<Object?> get props => [id];

  Profile get convertEntity => Profile(
        id: id,
        name: name,
        email: '',
      );
}
