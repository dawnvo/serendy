import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/features/user/domain/usecases/create_user_usecase.dart';
import 'package:serendy/src/features/user/domain/usecases/edit_profile_usecase.dart';
import 'package:serendy/src/features/user/domain/usecases/get_user_usecase.dart';
import 'package:serendy/src/features/user/domain/usecases/remove_user_usecase.dart';
import 'package:serendy/src/features/user/infrastructure/user_repository_impl.dart';

abstract final class UserModule {
  // Persistence Providers

  static const userRepository = UserRepositoryImpl();

  // UseCase Providers

  static const getUserUsecase = GetUserUsecase(
    UserModule.userRepository,
  );

  static const createUserUsecase = CreateUserUsecase(
    UserModule.userRepository,
    ThemeModule.themeRepository,
  );

  static const editProfileUsecase = EditProfileUsecase(
    UserModule.userRepository,
  );

  static const removeUserUsecase = RemoveUserUsecase(
    UserModule.userRepository,
  );
}
