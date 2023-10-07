import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/profile/profile.dart';
import 'package:serendy/src/features/theme/domain/usecases/add_theme_item_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/create_theme_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/delete_theme_item_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/edit_theme_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/get_theme_items_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/get_theme_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/get_themes_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/remove_theme_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/watch_themes_usecase.dart';
import 'package:serendy/src/features/theme/infrastructure/theme_repository_impl.dart';

abstract final class ThemeModule {
  // Persistence
  static const themeRepository = ThemeRepositoryImpl();

  // UseCase
  static const watchThemesUsecase = WatchThemesUsecase(
    ThemeModule.themeRepository,
  );

  static const getThemesUsecase = GetThemesUsecase(
    ThemeModule.themeRepository,
  );

  static const getThemeUsecase = GetThemeUsecase(
    ThemeModule.themeRepository,
  );

  static const createThemeUsecase = CreateThemeUsecase(
    ThemeModule.themeRepository,
    ProfileModule.profileRepository,
  );

  static const editThemeUsecase = EditThemeUsecase(
    ThemeModule.themeRepository,
  );

  static const removeThemeUsecase = RemoveThemeUsecase(
    ThemeModule.themeRepository,
  );

  static const getThemeItemsUsecase = GetThemeItemsUsecase(
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
