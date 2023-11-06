import 'package:serendy/src/features/user/domain/usecases/check_username_usecase.dart';
import 'package:serendy/src/features/user/domain/usecases/create_user_usecase.dart';
import 'package:serendy/src/features/user/domain/usecases/delete_user_usecase.dart';
import 'package:serendy/src/features/user/domain/usecases/edit_profile_usecase.dart';
import 'package:serendy/src/features/user/domain/usecases/get_user_usecase.dart';
import 'package:serendy/src/features/user/infrastructure/user_repository_impl.dart';
import 'package:serendy/src/features/user/user.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/configs/configs.dart';

part 'user_module.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return UserRepositoryImpl(supabase);
}

@riverpod
CheckUsernameUsecase checkUsernameUsecase(CheckUsernameUsecaseRef ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return CheckUsernameUsecase(userRepository);
}

@riverpod
GetUserUsecase getUserUsecase(GetUserUsecaseRef ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return GetUserUsecase(userRepository);
}

@riverpod
CreateUserUsecase createUserUsecase(CreateUserUsecaseRef ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  final themeRepository = ref.watch(themeRepositoryProvider);
  return CreateUserUsecase(userRepository, themeRepository);
}

@riverpod
EditProfileUsecase editProfileUsecase(EditProfileUsecaseRef ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return EditProfileUsecase(userRepository);
}

@riverpod
DeleteUserUsecase deleteUserUsecase(DeleteUserUsecaseRef ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return DeleteUserUsecase(userRepository);
}
