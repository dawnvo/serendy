import 'package:serendy/src/core/infrastructure/infrastructure_module.dart';
import 'package:serendy/src/core/persistence/file_storage.dart';
import 'package:serendy/src/core/persistence/firestore_path.dart';
import 'package:serendy/src/features/media/application/media_module.dart';
import 'package:serendy/src/features/theme/domain/usecases/add_theme_item_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/create_theme_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/delete_theme_item_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/edit_theme_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/get_theme_list_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/get_theme_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/remove_theme_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/watch_theme_list_usecase.dart';
import 'package:serendy/src/features/theme/infrastructure/theme_repository_impl.dart';
import 'package:serendy/src/features/user/application/user_module.dart';

abstract final class ThemeModule {
  // Persistence
  static final themeRepository = ThemeRepositoryImpl(
    InfrastructureModule.firestore,
  );

  static final themeFileStorage = FileStorageImpl(
    FirestorePath.theme,
    InfrastructureModule.storage,
  );

  // UseCase
  static final watchThemeListUsecase = WatchThemeListUsecase(
    ThemeModule.themeRepository,
  );

  static final getThemeListUsecase = GetThemeListUsecase(
    ThemeModule.themeRepository,
  );

  static final getThemeUsecase = GetThemeUsecase(
    ThemeModule.themeRepository,
  );

  static final createThemeUsecase = CreateThemeUsecase(
    ThemeModule.themeRepository,
    UserModule.userRepository,
  );

  static final editThemeUsecase = EditThemeUsecase(
    ThemeModule.themeRepository,
    ThemeModule.themeFileStorage,
  );

  static final removeThemeUsecase = RemoveThemeUsecase(
    ThemeModule.themeRepository,
    ThemeModule.themeFileStorage,
  );

  static final addThemeItemUsecase = AddThemeItemUsecase(
    ThemeModule.themeRepository,
    MediaModule.mediaRepository,
  );

  static final deleteThemeItemUsecase = DeleteThemeItemUsecase(
    ThemeModule.themeRepository,
  );
}
