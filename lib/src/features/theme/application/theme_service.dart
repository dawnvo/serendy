import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/theme/theme.dart';

part 'theme_service.g.dart';

/// 나의 테마 목록을 불러와요.
@riverpod
Future<List<Theme?>> getMyThemes(
  GetMyThemesRef ref,
) {
  final userId = ref.watch(currentUserIdProvider);
  return ref.read(getThemesUsecaseProvider).execute((
    executorId: userId,
    page: null,
  ));
}

/// 테마 여럿을 불러와요.
@riverpod
Future<List<Theme?>> getThemes(
  GetThemesRef ref, {
  int? page,
}) {
  return ref.read(getThemesUsecaseProvider).execute((
    executorId: null,
    page: page,
  ));
}

/// 테마를 불러와요.
@riverpod
Future<Theme> getTheme(
  GetThemeRef ref, {
  required ThemeID id,
}) {
  final userId = ref.watch(currentUserIdProvider);
  return ref.read(getThemeUsecaseProvider).execute((
    executorId: userId,
    themeId: id,
  ));
}

/// 테마를 만들어요.
@riverpod
Future<Theme> createTheme(
  CreateThemeRef ref, {
  required String title,
}) {
  final userId = ref.watch(requireUserIdProvider);
  return ref.read(createThemeUsecaseProvider).execute((
    executorId: userId,
    title: title,
  ));
}

/// 테마를 수정해요.
@riverpod
Future<Theme> editTheme(
  EditThemeRef ref, {
  required ThemeID id,
  required String title,
  final String? description,
  final String? image,
  final bool? private,
}) {
  final userId = ref.watch(requireUserIdProvider);
  return ref.read(editThemeUsecaseProvider).execute((
    executorId: userId,
    themeId: id,
    description: description,
    title: title,
    image: image,
    private: private,
  ));
}

/// 테마를 제거해요.
@riverpod
Future<void> removeTheme(
  RemoveThemeRef ref, {
  required ThemeID id,
}) {
  final userId = ref.watch(requireUserIdProvider);
  return ref.read(removeThemeUsecaseProvider).execute((
    executorId: userId,
    themeId: id,
  ));
}

/// 테마 항목을 불러와요.
@riverpod
Future<List<ThemeItem?>> getThemeItems(
  GetThemeItemsRef ref, {
  required ThemeID id,
}) {
  return ref.read(getThemeItemsUsecaseProvider).execute((themeId: id));
}

/// 테마에 항목을 추가해요.
@riverpod
Future<Theme> addThemeItem(
  AddThemeItemRef ref, {
  required ThemeID id,
  required MediaID mediaId,
}) {
  final userId = ref.watch(requireUserIdProvider);
  return ref.read(addThemeItemUsecaseProvider).execute((
    executorId: userId,
    themeId: id,
    mediaId: mediaId,
  ));
}

/// 테마의 항목을 제거해요.
@riverpod
Future<Theme> deleteThemeItem(
  DeleteThemeItemRef ref, {
  required ThemeID id,
  required MediaID mediaId,
}) {
  final userId = ref.watch(requireUserIdProvider);
  return ref.read(deleteThemeItemUsecaseProvider).execute((
    executorId: userId,
    themeId: id,
    mediaId: mediaId,
  ));
}
