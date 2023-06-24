import 'package:serendy/src/core/infrastructure_module.dart';
import 'package:serendy/src/core/persistence/file_storage.dart';
import 'package:serendy/src/core/persistence/firestore_path.dart';
import 'package:serendy/src/features/collection/collection.dart';
import 'package:serendy/src/features/user/domain/usecases/create_user_usecase.dart';
import 'package:serendy/src/features/user/domain/usecases/edit_profile_usecase.dart';
import 'package:serendy/src/features/user/domain/usecases/get_user_usecase.dart';
import 'package:serendy/src/features/user/domain/usecases/remove_user_usecase.dart';
import 'package:serendy/src/features/user/infrastructure/user_repository_impl.dart';

abstract final class UserModule {
  // Persistence Providers

  static final userRepository = UserRepositoryImpl(
    InfrastructureModule.firestore,
  );

  static final userFileStorage = FileStorageImpl(
    FirestorePath.user,
    InfrastructureModule.storage,
  );

  // UseCase Providers

  static final getUserUsecase = GetUserUsecase(
    UserModule.userRepository,
  );

  static final createUserUsecase = CreateUserUsecase(
    UserModule.userRepository,
    CollectionModule.collectionRepository,
  );

  static final editProfileUsecase = EditProfileUsecase(
    UserModule.userRepository,
    UserModule.userFileStorage,
  );

  static final removeUserUsecase = RemoveUserUsecase(
    UserModule.userRepository,
  );
}
