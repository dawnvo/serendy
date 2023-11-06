import 'package:serendy/src/features/theme/domain/usecases/add_theme_item_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/create_theme_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/delete_theme_item_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/edit_theme_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/get_theme_items_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/get_theme_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/get_themes_usecase.dart';
import 'package:serendy/src/features/theme/domain/usecases/remove_theme_usecase.dart';
import 'package:serendy/src/features/theme/infrastructure/theme_repository_impl.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';
import 'package:serendy/src/configs/configs.dart';

part 'theme_module.g.dart';

@riverpod
ThemeRepository themeRepository(ThemeRepositoryRef ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return ThemeRepositoryImpl(supabase);
}

@riverpod
GetThemesUsecase getThemesUsecase(GetThemesUsecaseRef ref) {
  final themeRepository = ref.watch(themeRepositoryProvider);
  return GetThemesUsecase(themeRepository);
}

@riverpod
GetThemeUsecase getThemeUsecase(GetThemeUsecaseRef ref) {
  final themeRepository = ref.watch(themeRepositoryProvider);
  return GetThemeUsecase(themeRepository);
}

@riverpod
CreateThemeUsecase createThemeUsecase(CreateThemeUsecaseRef ref) {
  final themeRepository = ref.watch(themeRepositoryProvider);
  final userRepository = ref.watch(userRepositoryProvider);
  return CreateThemeUsecase(themeRepository, userRepository);
}

@riverpod
EditThemeUsecase editThemeUsecase(EditThemeUsecaseRef ref) {
  final themeRepository = ref.watch(themeRepositoryProvider);
  return EditThemeUsecase(themeRepository);
}

@riverpod
RemoveThemeUsecase removeThemeUsecase(RemoveThemeUsecaseRef ref) {
  final themeRepository = ref.watch(themeRepositoryProvider);
  return RemoveThemeUsecase(themeRepository);
}

@riverpod
GetThemeItemsUsecase getThemeItemsUsecase(GetThemeItemsUsecaseRef ref) {
  final themeRepository = ref.watch(themeRepositoryProvider);
  return GetThemeItemsUsecase(themeRepository);
}

@riverpod
AddThemeItemUsecase addThemeItemUsecase(AddThemeItemUsecaseRef ref) {
  final themeRepository = ref.watch(themeRepositoryProvider);
  final mediaRepository = ref.watch(mediaRepositoryProvider);
  return AddThemeItemUsecase(themeRepository, mediaRepository);
}

@riverpod
DeleteThemeItemUsecase deleteThemeItemUsecase(DeleteThemeItemUsecaseRef ref) {
  final themeRepository = ref.watch(themeRepositoryProvider);
  return DeleteThemeItemUsecase(themeRepository);
}
