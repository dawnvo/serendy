import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:serendy/core/locator.dart';
import 'package:serendy/core/network/firestore_path.dart';
import 'package:serendy/core/network/media_file_storage.dart';
import 'package:serendy/features/collection/domain/ports/persistence/collection_repository_port.dart';
import 'package:serendy/features/user/application/services/user_service.dart';
import 'package:serendy/features/user/data/repositories/user_repository.dart';
import 'package:serendy/features/user/domain/ports/persistence/user_repository_port.dart';
import 'package:serendy/features/user/domain/usecases/create_user_usecase.dart';
import 'package:serendy/features/user/domain/usecases/edit_profile_usecase.dart';
import 'package:serendy/features/user/domain/usecases/get_user_usecase.dart';
import 'package:serendy/features/user/domain/usecases/remove_user_usecase.dart';

abstract final class UserModule {
  static const _key = 'UserModule';
  static void dependencies() {
    // [Persistence]
    sl.registerSingleton<UserRepositoryPort>(
      UserRepository(sl<FirebaseFirestore>()),
    );
    sl.registerLazySingleton<MediaFileStoragePort>(
      instanceName: _key,
      () => MediaFileStorage(
        FirestorePath.user,
        sl<FirebaseStorage>(),
      ),
    );

    // [UseCase]
    sl.registerLazySingleton<GetUserUsecase>(
      () => GetUserUsecase(
        sl<UserRepositoryPort>(),
      ),
    );
    sl.registerLazySingleton<CreateUserUsecase>(
      () => CreateUserUsecase(
        sl<UserRepositoryPort>(),
        sl<CollectionRepositoryPort>(),
      ),
    );
    sl.registerLazySingleton<EditProfileUsecase>(
      () => EditProfileUsecase(
        sl<UserRepositoryPort>(),
        sl<MediaFileStoragePort>(instanceName: _key),
      ),
    );
    sl.registerLazySingleton<RemoveUserUsecase>(
      () => RemoveUserUsecase(
        sl<UserRepositoryPort>(),
      ),
    );

    // [Service]
    sl.registerLazySingleton<UserService>(
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
