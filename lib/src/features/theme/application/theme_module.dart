import 'package:serendy/src/features/media/application/media_module.dart';
import 'package:serendy/src/features/theme/domain/usecases/add_theme_item_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/create_theme_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/delete_theme_item_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/edit_theme_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/get_theme_items_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/get_theme_list_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/get_theme_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/remove_theme_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/watch_theme_list_usecase.dart';
import 'package:serendy/src/features/theme/infrastructure/theme_repository_impl.dart';
import 'package:serendy/src/features/user/application/user_module.dart';

abstract final class ThemeModule {
  // Persistence
  static const themeRepository = ThemeRepositoryImpl();

  // UseCase
  static const watchThemeListUsecase = WatchThemeListUsecase(
    ThemeModule.themeRepository,
  );

  static const getThemeListUsecase = GetThemeListUsecase(
    ThemeModule.themeRepository,
  );

  static const getThemeUsecase = GetThemeUsecase(
    ThemeModule.themeRepository,
  );

  static const getThemeItemsUsecase = GetThemeItemsUsecase(
    ThemeModule.themeRepository,
  );

  static const createThemeUsecase = CreateThemeUsecase(
    ThemeModule.themeRepository,
    UserModule.userRepository,
  );

  static const editThemeUsecase = EditThemeUsecase(
    ThemeModule.themeRepository,
  );

  static const removeThemeUsecase = RemoveThemeUsecase(
    ThemeModule.themeRepository,
  );

  static const addThemeItemUsecase = AddThemeItemUsecase(
    ThemeModule.themeRepository,
    MediaModule.mediaRepository,
  );

  static const deleteThemeItemUsecase = DeleteThemeItemUsecase(
    ThemeModule.themeRepository,
  );
}
