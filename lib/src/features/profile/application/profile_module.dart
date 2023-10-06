import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/features/profile/domain/usecases/create_profile_usecase.dart';
import 'package:serendy/src/features/profile/domain/usecases/edit_profile_usecase.dart';
import 'package:serendy/src/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:serendy/src/features/profile/domain/usecases/remove_profile_usecase.dart';
import 'package:serendy/src/features/profile/infrastructure/profile_repository_impl.dart';

abstract final class ProfileModule {
  // Persistence Providers

  static const profileRepository = ProfileRepositoryImpl();

  // UseCase Providers

  static const getProfileUsecase = GetProfileUsecase(
    ProfileModule.profileRepository,
  );

  static const createProfileUsecase = CreateProfileUsecase(
    ProfileModule.profileRepository,
    ThemeModule.themeRepository,
  );

  static const editProfileUsecase = EditProfileUsecase(
    ProfileModule.profileRepository,
  );

  static const removeProfileUsecase = RemoveProfileUsecase(
    ProfileModule.profileRepository,
  );
}
