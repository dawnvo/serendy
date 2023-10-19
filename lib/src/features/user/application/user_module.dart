import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/features/user/domain/usecases/create_user_usecase.dart';
import 'package:serendy/src/features/user/domain/usecases/edit_profile_usecase.dart';
import 'package:serendy/src/features/user/domain/usecases/get_user_usecase.dart';
import 'package:serendy/src/features/user/domain/usecases/remove_user_usecase.dart';
import 'package:serendy/src/features/user/infrastructure/user_repository_impl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract final class UserModule {
  //persistence

  static final userRepository = UserRepositoryImpl(
    Supabase.instance.client,
  );

  //use-case

  static final getUserUsecase = GetUserUsecase(
    UserModule.userRepository,
  );

  static final createUserUsecase = CreateUserUsecase(
    UserModule.userRepository,
    ThemeModule.themeRepository,
  );

  static final editProfileUsecase = EditProfileUsecase(
    UserModule.userRepository,
  );

  static final removeUserUsecase = RemoveUserUsecase(
    UserModule.userRepository,
  );
}
