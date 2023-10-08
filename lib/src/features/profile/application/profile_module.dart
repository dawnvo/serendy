import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/features/profile/domain/usecases/create_profile_usecase.dart';
import 'package:serendy/src/features/profile/domain/usecases/edit_profile_usecase.dart';
import 'package:serendy/src/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:serendy/src/features/profile/domain/usecases/remove_profile_usecase.dart';
import 'package:serendy/src/features/profile/infrastructure/profile_repository_impl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract final class ProfileModule {
  // Persistence Providers

  static final profileRepository = ProfileRepositoryImpl(
    Supabase.instance.client,
  );

  // UseCase Providers

  static final getProfileUsecase = GetProfileUsecase(
    ProfileModule.profileRepository,
  );

  static final createProfileUsecase = CreateProfileUsecase(
    ProfileModule.profileRepository,
    ThemeModule.themeRepository,
  );

  static final editProfileUsecase = EditProfileUsecase(
    ProfileModule.profileRepository,
  );

  static final removeProfileUsecase = RemoveProfileUsecase(
    ProfileModule.profileRepository,
  );
}
