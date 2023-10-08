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
import 'package:serendy/src/features/theme/infrastructure/theme_repository_impl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract final class ThemeModule {
  // Persistence
  static final themeRepository = ThemeRepositoryImpl(
    Supabase.instance.client,
  );

  // UseCase

  static final getThemesUsecase = GetThemesUsecase(
    ThemeModule.themeRepository,
  );

  static final getThemeUsecase = GetThemeUsecase(
    ThemeModule.themeRepository,
  );

  static final createThemeUsecase = CreateThemeUsecase(
    ThemeModule.themeRepository,
    ProfileModule.profileRepository,
  );

  static final editThemeUsecase = EditThemeUsecase(
    ThemeModule.themeRepository,
  );

  static final removeThemeUsecase = RemoveThemeUsecase(
    ThemeModule.themeRepository,
  );

  static final getThemeItemsUsecase = GetThemeItemsUsecase(
    ThemeModule.themeRepository,
  );

  static final addThemeItemUsecase = AddThemeItemUsecase(
    ThemeModule.themeRepository,
    MediaModule.mediaRepository,
  );

  static final deleteThemeItemUsecase = DeleteThemeItemUsecase(
    ThemeModule.themeRepository,
  );
}
