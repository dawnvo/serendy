import 'package:serendy/core/locator.dart';
import 'package:serendy/core/persistence/firestore_path.dart';
import 'package:serendy/core/persistence/media_file_storage.dart';
import 'package:serendy/features/user/application/user_service.dart';
import 'package:serendy/features/user/domain/usecases/create_user_usecase.dart';
import 'package:serendy/features/user/domain/usecases/edit_profile_usecase.dart';
import 'package:serendy/features/user/domain/usecases/get_user_usecase.dart';
import 'package:serendy/features/user/domain/usecases/remove_user_usecase.dart';
import 'package:serendy/features/user/infrastructure/user_repository_impl.dart';

abstract final class UserModule {
  static const _instance = 'UserModule';
  static void dependencies() {
    // [Persistence]
    sl.registerSingleton(UserRepositoryImpl(sl()));
    sl.registerLazySingleton(
      () => MediaFileStorageImpl(FirestorePath.user, sl()),
      instanceName: _instance,
    );

    // [UseCase]
    sl.registerLazySingleton(() => GetUserUsecase(sl()));
    sl.registerLazySingleton(() => CreateUserUsecase(sl(), sl()));
    sl.registerLazySingleton(
        () => EditProfileUsecase(sl(), sl(instanceName: _instance)));
    sl.registerLazySingleton(() => RemoveUserUsecase(sl()));

    // [Service]
    sl.registerLazySingleton(
      () => UserService(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
  }
}
