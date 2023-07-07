import 'package:serendy/src/core/domain/usecase.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/features/user/user.dart';

typedef CreateUserPayload = ({
  String id,
  String name,
  String email,
  String? avatar,
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
    // 사용자 식별자
    final userId = payload.id;

    // 사용자 생성
    final user = User(
      id: userId,
      name: payload.name,
      email: payload.email,
      avatar: payload.avatar,
    );

    await _userRepository.create(user);
    await _createDefaultTheme(user);

    return user;
  }

  /// ⭐ 사용자의 기본 테마 생성
  /// 기본 테마는 사용자 식별자로 이루어집니다.
  Future<void> _createDefaultTheme(User user) async {
    final theme = Theme(
      owner: ThemeOwner(
        id: user.id,
        name: user.name,
      ),
      id: user.id,
      title: '보고싶은',
      image: null,
      private: true,
    );

    await _themeRepository.create(theme);
  }
}
