import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/user/user.dart';
import 'package:serendy/src/features/theme/theme.dart';

typedef CreateUserPayload = ({
  UserID id,
  String name,
  String email,
});

final class CreateUserUsecase implements UseCase<CreateUserPayload, User> {
  const CreateUserUsecase(
    this._userRepository,
    this._themeRepository,
  );

  final UserRepository _userRepository;
  final ThemeRepository _themeRepository;

  @override
  Future<User> execute(CreateUserPayload payload) async {
    // * 사용자 인스턴스를 생성해요.
    final user = User(
      id: payload.id,
      email: payload.email,
      username: payload.name,
    );

    // * commit
    await _userRepository.createUser(user);
    await _createDefaultTheme(user);
    return user;
  }

  /**
   * '보고싶은' 테마를 만들어요.
   */
  Future<void> _createDefaultTheme(User user) async {
    final theme = Theme(
      owner: ThemeOwner(id: user.id, username: user.username),
      image: Assets.themeFavoriteImage,
      title: '보고싶은',
      private: true,
      id: user.id,
    );

    await _themeRepository.createTheme(theme);
  }
}
